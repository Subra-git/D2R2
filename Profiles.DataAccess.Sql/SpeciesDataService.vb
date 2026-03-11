Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.Data.SqlClient
Imports Profiles.DataAccess.Sql.Data
Imports System.Transactions

Public Class SpeciesDataService
    Implements ISpeciesDataService

    Public Function GetAllSpecies() As System.Collections.Generic.List(Of SpeciesData) Implements ISpeciesDataService.GetAllSpecies

        Dim SpeciesList As New List(Of SpeciesData)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaSpecies"
                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        Dim currentSpecies As New SpeciesData() With { _
                                .Id = reader.GetGuid(0), _
                                .ParentId = reader.GetGuid(1), _
                                .Description = reader.GetString(2), _
                                .IsActive = reader.GetBoolean(3), _
                                .IsInUse = reader.GetBoolean(4)}
                        SpeciesList.Add(currentSpecies)
                    End While
                End Using
            End Using
        End Using
        Return SpeciesList
    End Function

    Public Function GetSpeciesMetadata() As System.Collections.Generic.List(Of Contracts.DataContracts.SpeciesSectionMetadata) Implements Contracts.ServiceContracts.ISpeciesDataService.GetSpeciesMetadata

        Dim sectionDictionary As New Dictionary(Of Guid, SpeciesSectionMetadata)
        Dim questionDictionary As New Dictionary(Of Guid, SpeciesQuestionMetadata)
        Dim fieldDictionary As New Dictionary(Of Guid, SpeciesFieldMetadata)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaSpeciesSectionMetadata"

                Using reader As New SafeDataReader(getCommand.ExecuteReader)

                    While reader.Read()
                        Dim currentSpeciesSection As New SpeciesSectionMetadata With { _
                        .Id = reader.GetGuid(0), _
                        .Name = reader.GetString(1), _
                        .ShortName = reader.GetString(2), _
                        .SectionNumber = reader.GetInt32(3), _
                        .QuestionMetadataList = New List(Of QuestionMetadata) _
                        }

                        sectionDictionary.Add(currentSpeciesSection.Id, currentSpeciesSection)

                    End While

                    If reader.NextResult() Then
                        While reader.Read

                            Dim currentSpeciesQuestion As New SpeciesQuestionMetadata With { _
                            .SectionId = reader.GetGuid(0), _
                            .Id = reader.GetGuid(1), _
                            .Name = reader.GetString(2), _
                            .QuestionNumber = reader.GetInt32(3), _
                            .ShortName = reader.GetString(4), _
                            .FieldMetadataList = New List(Of FieldMetadata) _
                            }

                            questionDictionary.Add(currentSpeciesQuestion.Id, currentSpeciesQuestion)

                        End While
                    End If

                    If reader.NextResult() Then
                        While reader.Read

                            Dim currentFieldQuestion As New SpeciesFieldMetadata With {
                            .QuestionId = reader.GetGuid(1),
                            .Id = reader.GetGuid(2),
                            .Name = reader.GetString(3),
                            .ShortName = reader.GetString(4),
                            .FieldNumber = reader.GetInt32(5),
                            .DataFieldTypeId = reader.GetGuid(6),
                            .DataTypeName = reader.GetString(7),
                            .IsMandatory = reader.GetBoolean(8),
                            .ReferenceTableId = reader.GetGuid(9),
                            .ReferenceTableIsMaintainable = reader.GetBoolean(10),
                            .EditorFieldType = reader.GetInt32(11)
                            }

                            fieldDictionary.Add(currentFieldQuestion.Id, currentFieldQuestion)

                        End While
                    End If

                End Using
            End Using
        End Using

        For Each speciesField As SpeciesFieldMetadata In fieldDictionary.Values
            questionDictionary(speciesField.QuestionId).FieldMetadataList.Add(speciesField)
        Next

        For Each speciesQuestion As SpeciesQuestionMetadata In questionDictionary.Values
            sectionDictionary(speciesQuestion.SectionId).QuestionMetadataList.Add(speciesQuestion)
        Next

        Return sectionDictionary.Values.ToList()

    End Function

    Public Function GetSpeciesAnswerData(ByVal request As GetSpeciesAnswerDataRequest) As Contracts.DataContracts.SpeciesAnswerData Implements Contracts.ServiceContracts.ISpeciesDataService.GetSpeciesAnswerData

        Dim dtoAnswerData As New SpeciesAnswerData()
        Dim dtoSpeciesSectionList As New List(Of SpeciesSection)
        Dim fieldValueListDictionary As New Dictionary(Of Guid, List(Of SpeciesFieldValue))

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgSpeciesAnswerData"
                getCommand.Parameters.AddWithValue("@SpeciesId", request.SpeciesId)
                Using reader As New SafeDataReader(getCommand.ExecuteReader)

                    While reader.Read()
                        reader.GetBytes("LastUpdated", 0, dtoAnswerData.LastUpdated, 0, 8)
                        dtoAnswerData.SpeciesName = reader.GetString(1)
                        dtoAnswerData.SpeciesId = reader.GetGuid(2)
                    End While

                    If reader.NextResult() Then
                        While reader.Read()
                            Dim dtoSection As New SpeciesSection With { _
                           .SectionId = reader.GetGuid(0) _
                           }

                            dtoSpeciesSectionList.Add(dtoSection)

                            Dim fieldValueList As New List(Of SpeciesFieldValue)
                            fieldValueListDictionary.Add(dtoSection.SectionId, fieldValueList)
                        End While
                    End If

                    If reader.NextResult() Then
                        While reader.Read()

                            Dim sectionId As Guid = reader.GetGuid(0)

                            Dim dtoFieldValue As New SpeciesFieldValue With { _
                            .Id = reader.GetGuid(1), _
                            .BooleanValue = reader.GetBoolean(2), _
                            .ListValue = reader.GetGuid(3), _
                            .TextValue = reader.GetString(4), _
                            .QuestionId = reader.GetGuid(5), _
                            .FieldNumber = reader.GetInt32(6) _
                            }

                            fieldValueListDictionary(sectionId).Add(dtoFieldValue)

                        End While
                    End If

                End Using
            End Using
        End Using

        For Each section As SpeciesSection In dtoSpeciesSectionList
            section.FieldValueList = fieldValueListDictionary(section.SectionId)
        Next

        dtoAnswerData.SpeciesId = request.SpeciesId
        dtoAnswerData.SpeciesSectionList = dtoSpeciesSectionList

        Return dtoAnswerData

    End Function

    Public Function UpdateSpeciesAnswerData(ByVal request As Contracts.DataContracts.SpeciesAnswerDataChangeSet) As Contracts.DataContracts.SpeciesAnswerDataChangeResult Implements Contracts.ServiceContracts.ISpeciesDataService.UpdateSpeciesAnswerData

        Dim result As New SpeciesAnswerDataChangeResult

        Using transaction As New TransactionScope

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                result.LastUpdated = UpdateSpeciesSectionListTimeStamp(request, connection)

                If request.FieldValueUpdateList.Count > 0 Then
                    For Each item As SpeciesFieldValueUpdate In request.FieldValueUpdateList
                        If item.ParameterName = "@MultiValue" Then
                            UpdateMultiFieldValue(item, connection, request.SpeciesId)
                        Else
                            UpdateFieldValue(item, connection, request.SpeciesId)
                        End If
                    Next

                End If

                Using calculateCommand As SqlCommand = connection.CreateCommand
                    calculateCommand.CommandType = CommandType.StoredProcedure
                    calculateCommand.CommandText = "sppSpeciesPrioritisationScore"
                    calculateCommand.ExecuteNonQuery()
                End Using

            End Using
            transaction.Complete()
        End Using

        Return result

    End Function

    Private Function UpdateSpeciesSectionListTimeStamp(ByVal request As SpeciesAnswerDataChangeSet, ByVal connection As SqlConnection) As Byte()

        Dim lastUpdated(7) As Byte

        'update the species timestamp
        Using updateSpeciesDataCommand As SqlCommand = connection.CreateCommand
            With updateSpeciesDataCommand
                .CommandType = CommandType.StoredProcedure
                .CommandText = "spuSpeciesAnswerData"
                .Parameters.AddWithValue("@SpeciesId", request.SpeciesId)
                .Parameters.AddWithValue("@LastUpdated", request.LastUpdated)
                Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
                output.Direction = ParameterDirection.Output
                .Parameters.Add(output)
                .ExecuteNonQuery()
                lastUpdated = CType(.Parameters("@NewLastUpdated").Value, Byte())
            End With
        End Using

        Return lastUpdated

    End Function

    Private Sub UpdateFieldValue(ByVal item As SpeciesFieldValueUpdate, ByVal connection As SqlConnection, ByVal speciesId As Guid)

        Using updateFieldValueCommand As SqlCommand = connection.CreateCommand()
            updateFieldValueCommand.CommandType = CommandType.StoredProcedure

            updateFieldValueCommand.CommandText = "spuSpeciesFieldValue"
            updateFieldValueCommand.Parameters.AddWithValue("@SpeciesId", speciesId)
            updateFieldValueCommand.Parameters.AddWithValue("@SpeciesFieldId", item.FieldId)

            Select Case item.ParameterName
                Case String.Empty
                    ' don't add any parameters here. The stored procedure gives defaults of DBNULL
                Case "@BooleanValue"
                    updateFieldValueCommand.Parameters.AddWithValue(item.ParameterName, item.BooleanValue)
                Case "@ListValue"
                    updateFieldValueCommand.Parameters.AddWithValue(item.ParameterName, item.ListValue)
                Case "@TextValue"
                    updateFieldValueCommand.Parameters.AddWithValue(item.ParameterName, item.TextValue)
            End Select

            updateFieldValueCommand.ExecuteNonQuery()

        End Using

    End Sub

    Private Sub UpdateMultiFieldValue(ByVal item As SpeciesFieldValueUpdate, ByVal connection As SqlConnection, ByVal speciesId As Guid)

        'first, remove all multi-values from the database
        Using deleteMultiValueCommand As SqlCommand = connection.CreateCommand
            deleteMultiValueCommand.CommandType = CommandType.StoredProcedure
            deleteMultiValueCommand.CommandText = "spdSpeciesFieldMultiValue"
            deleteMultiValueCommand.Parameters.AddWithValue("@SpeciesId", speciesId)
            deleteMultiValueCommand.Parameters.AddWithValue("@SpeciesFieldId", item.FieldId)
            deleteMultiValueCommand.ExecuteNonQuery()
        End Using

        'then add back in any multi-values that are in this object
        Using insertMultiValueCommand As SqlCommand = connection.CreateCommand
            insertMultiValueCommand.CommandType = CommandType.StoredProcedure
            insertMultiValueCommand.CommandText = "spiSpeciesFieldMultiValue"
            insertMultiValueCommand.Parameters.AddWithValue("@SpeciesId", speciesId)
            insertMultiValueCommand.Parameters.AddWithValue("@SpeciesFieldId", item.FieldId)

            Dim valueParameter As New SqlParameter("@ListValue", SqlDbType.UniqueIdentifier)
            insertMultiValueCommand.Parameters.Add(valueParameter)
            'execute the stored procedure once for each value in the multi-value, inserting that value into the database
            For Each id As Guid In item.MultiValueList
                valueParameter.Value = id
                insertMultiValueCommand.ExecuteNonQuery()
            Next

        End Using

    End Sub

    Public Function GetAllSelectedSpecies(ByVal request As String) As System.Collections.Generic.List(Of SpeciesData) Implements ISpeciesDataService.GetAllSelectedSpecies

        Dim SpeciesList As New List(Of SpeciesData)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaSelectedDiseaseSpecies"
                getCommand.Parameters.AddWithValue("@DiseaseName", request)
                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        Dim currentSpecies As New SpeciesData() With { _
                                .Id = reader.GetGuid(0), _
                                .ParentId = reader.GetGuid(1), _
                                .Description = reader.GetString(2), _
                                .IsActive = reader.GetBoolean(3), _
                                .IsInUse = reader.GetBoolean(4), _
                                .DiseaseName = reader.GetString(5), _
                                .Disease1 = Convert.ToInt16(reader(6)), _
                                .Disease2 = Convert.ToInt16(reader(7)), _
                                .Disease3 = Convert.ToInt16(reader(8)), _
                                .Disease4 = Convert.ToInt16(reader(9)), _
                                .Disease5 = reader.GetString(10), _
                                .FilterNumber = Convert.ToInt64(reader(11))}
                        SpeciesList.Add(currentSpecies)
                    End While
                End Using
            End Using
        End Using
        Return SpeciesList
    End Function

End Class
