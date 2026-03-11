Imports ProfilesLibrary
Imports Microsoft.Office.Interop
Imports System.Text
Imports System.Data.SqlClient
Imports System.Configuration.ConfigurationManager
Imports System.IO

Module Main

    Private mDoc As Word.Document

    Private mProfileVersionId As Guid
    Private mSpeciesId As Guid = Guid.Empty
    Private mLogFolderName As String

    Public Sub Main(ByVal arguments() As String)

        mLogFolderName = DateTime.Now.ToString("yyyy-MM-dd HHmm")


        If arguments.Length <> 1 Then
            LogError(Nothing, "You must specify a path to a profile Word document.")
            Console.ReadKey()
            Exit Sub
        End If

        If Not ProfilesPrincipal.Login(Environment.UserDomainName & "\" & Environment.UserName) Then
            LogError(Nothing, "You are not authorized to use this application.")
            Console.ReadKey()
            Exit Sub
        End If

        Dim fileList As String() = System.IO.Directory.GetFiles(arguments(0))
        For Each file As String In fileList
            Console.WriteLine()
            Console.WriteLine("Importing " & Path.GetFileName(file) & "...")
            HandleProfile(file)
        Next
        Console.ReadKey()

    End Sub

    Private Sub HandleProfile(ByVal path As String)

        Dim wordApp As New Word.Application
        Dim profileName As String = System.IO.Path.GetFileName(path)

        Try
            mDoc = wordApp.Documents.Open(CType(path, Object), 1, 1, 0)

            If mDoc.FormFields.Count < 143 Then
                LogError(profileName, "The document is not a valid Profile document")
                Exit Sub
            End If

            Dim fieldCount As Integer = 83

            'Obtain the title of the profile from the first form field
            Dim parts As String() = Text.RegularExpressions.Regex.Split(FormFieldValue(1), "(.*) - (.*)")

            If parts.Length <> 4 Then
                LogError(profileName, "Profile name '" & FormFieldValue(1) & "' does not match the required format XXX-YYY")
                Exit Sub
            End If

            Dim title As String = parts(1)
            Dim speciesName As String = parts(2)
            'Attempt to find or create a profile version with the relevant title
            Dim speciesError As String = CreateUpdateProfileVersion(title, speciesName)
            If Not speciesError Is Nothing Then
                LogError(profileName, speciesError)
                Exit Sub
            End If


            Dim sectionList As ProfileSectionInfoList = ProfileSectionInfoList.GetList()
            For Each section As ProfileSectionInfo In sectionList
                Dim profileSection As ProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionId, section.Id)
                For Each question As ProfileVersionQuestion In profileSection.QuestionList

                    If question.ShortName = "Current Surveillance Activities" Then
                        LogError(profileName, section.SectionNumber, question.QuestionNumber, "Current Surveillance Activites could not be imported")
                        fieldCount += 72
                        Continue For
                    End If

                    'this question doesn't exist in the Word profile document
                    If question.ShortName = "Substantial Commercial Trade" Then
                        Continue For
                    End If

                    Dim fieldList As FieldValueList
                    If question.IsPerSpecies Then
                        fieldList = question.SpeciesList.GetById(mSpeciesId).FieldValues
                    Else
                        fieldList = question.FieldValues
                    End If

                    For Each field As FieldValue In fieldList

                        Dim importMessage As String = String.Empty
                        Dim checkFieldResult As Integer = CheckField(field.ShortName, importMessage)
                        If checkFieldResult > -1 Then
                            fieldCount += checkFieldResult
                            LogError(profileName, section.SectionNumber, question.QuestionNumber, field.ShortName & " " & importMessage)
                            Continue For
                        End If

                        If field.ShortName = "Potential For Silent Spread" Then
                            'skip document question 3.4 (17 fields) as doesn't exist in new system
                            fieldCount += 17
                        End If

                        Select Case field.DataType
                            Case DataFieldType.ListType
                                Dim lookup As LookupList = LookupList.GetList(field.ReferenceTableName)
                                Dim isFieldSelected As Boolean = False
                                Dim reportError As Boolean = False
                                For Each lookupItem As LookupList.NameValuePair In lookup
                                    If FormFieldValue(fieldCount) = "1" Then
                                        If Not isFieldSelected Then
                                            field.FieldValue = lookupItem.Key
                                            isFieldSelected = True
                                        Else
                                            reportError = True
                                        End If
                                        Alert(field.ShortName & " = " & lookupItem.Value)
                                    End If
                                    fieldCount += 1         
                                Next
                                If reportError Then
                                    LogError(profileName, section.SectionNumber, question.QuestionNumber, "Too many options selected for " & field.ShortName & ", first option imported only")
                                End If
                            Case DataFieldType.MultiValueListType
                                field.ClearFieldValues()
                                Dim lookup As LookupList = LookupList.GetList(field.ReferenceTableName)
                                For Each lookupItem As LookupList.NameValuePair In lookup
                                    If FormFieldValue(fieldCount) = "1" Then
                                        field.AddFieldValue(lookupItem.Key)
                                        Alert(field.ShortName & " = " & lookupItem.Value)
                                    End If
                                    fieldCount += 1
                                Next
                            Case DataFieldType.BooleanType
                                Dim isFieldSelected As Boolean = False
                                If FormFieldValue(fieldCount) = "1" Then
                                    field.FieldValue = True
                                    isFieldSelected = True
                                    Alert(field.ShortName & " = True")
                                End If
                                fieldCount += 1
                                If FormFieldValue(fieldCount) = "1" Then
                                    If Not isFieldSelected Then
                                        field.FieldValue = False                                        
                                    Else
                                        LogError(profileName, section.SectionNumber, question.QuestionNumber, "Too many options selected for " & field.ShortName & ", first option imported only")
                                    End If
                                    Alert(field.ShortName & " = False")
                                End If
                                fieldCount += 1
                            Case DataFieldType.DateType                               
                                Try
                                    field.FieldValue = DateTime.Parse(FormFieldValue(fieldCount))
                                Catch
                                    LogError(profileName, section.SectionNumber, question.QuestionNumber, "A valid date is required for " & field.ShortName & " this field has not been imported")
                                End Try                              
                                fieldCount += 1               
                            Case DataFieldType.DecimalType                                
                                Try
                                    field.FieldValue = System.Convert.ToDecimal(FormFieldValue(fieldCount))
                                Catch
                                    LogError(profileName, section.SectionNumber, question.QuestionNumber, "A decimal value of the format nnn.nn is required for " & field.ShortName & " this field has not been imported")
                                End Try
                                fieldCount += 1
                            Case DataFieldType.LongTextType, DataFieldType.TextType
                                field.FieldValue = FormFieldValue(fieldCount)
                                Alert(field.ShortName & " = " & FormFieldValue(fieldCount))
                                fieldCount += 1
                            Case Else
                                field.FieldValue = FormFieldValue(fieldCount)
                                Alert(field.ShortName & " = " & FormFieldValue(fieldCount))
                                fieldCount += 1
                        End Select
                    Next 'field
                Next 'question
                profileSection.Save()
            Next 'section

            Console.WriteLine("Successfully handled " & path)

        Catch ex As Exception
            LogError(profileName, "An error occurred whilst importing profile, the profile import may not be complete")
        Finally
            CType(mDoc, Word.DocumentClass).Close()
        End Try



    End Sub

    Private Function CreateUpdateProfileVersion(ByVal title As String, ByVal speciesName As String) As String

        Dim speciesError As String = Nothing

        Dim speciesList As SpeciesInfoList = SpeciesInfoList.GetList()
        mSpeciesId = FindSpeciesId(speciesList, speciesName)

        'if species invalid do not continue
        If mSpeciesId = Guid.Empty Then
            speciesError = "Profile species '" & speciesName & "' is not a recognised species"
        Else
            Dim profile As ProfileVersion = ProfileVersion.GetProfileVersion(title)
            If profile Is Nothing Then
                profile = ProfileVersion.NewProfile()
            End If

            profile.Title = title
            profile.Description = FormFieldValue(82)
            profile.AffectedSpeciesComments = FormFieldValue(143)

            Dim speciesAffected As Boolean
            For Each currentSpecies As Guid In profile.AffectedSpecies
                If currentSpecies = mSpeciesId Then
                    speciesAffected = True
                    Exit For
                End If
            Next
            If Not speciesAffected Then
                profile.AddAffectedSpecies(mSpeciesId)
            Else
                speciesError = "Profile already has species '" & speciesName & "' recorded as an affected species"
            End If

            profile.Save()
            mProfileVersionId = profile.Id
        End If

        Return speciesError
    End Function

    Private Function FindSpeciesId(ByVal speciesList As SpeciesInfoList, ByVal speciesName As String) As Guid

        For Each checkSpecies As SpeciesInfo In speciesList
            If checkSpecies.Description.ToLower() = speciesName.ToLower() Then
                Return checkSpecies.Id
            Else
                Dim checkId As Guid = FindSpeciesId(checkSpecies.ChildList, speciesName)
                If Not checkId.Equals(Guid.Empty) Then
                    Return checkId
                End If
            End If
        Next
        Return Guid.Empty

    End Function

    Private Function CheckField(ByVal fieldName As String, ByRef importMessage As String) As Integer

        Select Case fieldName
            Case "Date Of Most Recent Occurrence In GB" 'cannot import as date format required
                importMessage = "could not be imported as date format required"
                Return 1
            Case "Incubation Period Minimum" 'cannot import as unknown if day/hours etc
                importMessage = "could not be imported as unknown if day/hours etc"
                Return 1
            Case "Incubation Period Typical" 'cannot import as unknown if day/hours etc
                importMessage = "could not be imported as unknown if day/hours etc"
                Return 1
            Case "Incubation Period Maximum" 'cannot import as unknown if day/hours etc
                importMessage = "could not be imported as unknown if day/hours etc"
                Return 1
            Case "Primary Detection Methods" 'cannot import as list selection in system and free text in document
                importMessage = "could not be imported as profile document contains free text that cannot be imported into selection list"
                Return 1
            Case "Detection Method Type Comments" 'cannot import as primary detection method and comments in single field in document
                importMessage = "could not be imported as primary detection method and comments in single field in profile document"
                Return 0
            Case "Confirmation Of Diagnosis" 'cannot import as list selection in system and free text in document
                importMessage = "could not be imported as profile document contains free text that cannot be imported into selection list"
                Return 1
            Case "Diagnosis Mechanism Comments" 'cannot import as diagnosis method and comments in single field in document
                importMessage = "could not be imported as diagnosis method and comments in single field in document"
                Return 0
            Case "Human Transmission Mechanism" 'cannot import as different item selection between document and system
                importMessage = "could not be imported as available options have changed"
                Return 6
            Case "Current Control Mechanisms" 'cannot be imported as selection list doesnt exist in document
                importMessage = "could not be imported as selection list does not exist in profile document"
                Return 0
            Case "Other Control Mechanisms" 'cannot be imported as selection list doesnt exist in document
                importMessage = "could not be imported as selection list does not exist in profile document"
                Return 0
            Case "Impact On Level Of Imports" 'cannot be imported as this field contains read-only data taken from the species data
                importMessage = "could not be imported as this field contains read-only data taken from the species data"
                Return 3
            Case "Statutory Obligation To Control" 'cannot import as different lists in document and system
                importMessage = "could not be imported as available options have changed"
                Return 2
            Case "Importance Of Export Trade" 'cannot be imported as this field contains read-only data taken from the species data
                importMessage = "could not be imported as this field contains read-only data taken from the species data"
                Return 3
            Case "Impact On Intra Community Flows" 'cannot be imported as this field contains read-only data taken from the species data
                importMessage = "could not be imported as this field contains read-only data taken from the species data"
                Return 3
            Case "Impact On Third Country Flows" 'cannot be imported as this field contains read-only data taken from the species data
                importMessage = "could not be imported as this field contains read-only data taken from the species data"
                Return 3
            Case "Export Market Value" 'cannot be imported as this field contains read-only data taken from the species data
                importMessage = "could not be imported as this field contains read-only data taken from the species data"
                Return 3
        End Select

        Return -1

    End Function

    Private Sub Alert(ByVal text As String)

        If True Then
            'LogError(Nothing, text)
            'Console.WriteLine(text)
        End If

    End Sub

    Private Function FormFieldValue(ByVal fieldNumber As Integer) As String

        Return mDoc.FormFields(fieldNumber).Result()

    End Function


    Private Sub WriteErrorToFile(ByVal profileFileName As String, ByVal errorMessage As String)

        Dim writer As StreamWriter = Nothing
        Dim logFilePath As String = String.Empty
        Dim logFolder As String = String.Empty

        Try

            logFolder = AppSettings("LogFileLocation").ToString & "\Logs\" & mLogFolderName

            If Not Directory.Exists(logFolder) Then
                Directory.CreateDirectory(logFolder)
            End If

            logFilePath = logFolder & "\" & Path.GetFileNameWithoutExtension(profileFileName) & ".log"

            writer = New StreamWriter(logFilePath, True)

            Console.WriteLine(errorMessage)
            writer.WriteLine(errorMessage)

        Catch ex As Exception
            Console.WriteLine("Import error not recorded in log file")
        Finally
            If writer IsNot Nothing Then
                writer.Flush()
                writer.Close()
            End If
        End Try

    End Sub

    Private Sub LogError(ByVal profileFileName As String, ByVal importError As String)

        WriteErrorToFile(profileFileName, importError)
        
    End Sub

    Private Sub LogError(ByVal profileFileName As String, ByVal sectionNumber As Integer, ByVal questionNumber As Integer, ByVal importError As String)

        Dim errorMessage As String

        errorMessage = sectionNumber.ToString & "." & questionNumber.ToString & " : " & importError
        WriteErrorToFile(profileFileName, errorMessage)

    End Sub

End Module
