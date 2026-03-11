Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class DiseaseFilterValues
    Inherits NameValueListBase(Of Guid, String)

    Public Shared Function CanGetList() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor
    End Function

#Region " Factory Methods "

    Public Shared Function GetDiseaseReferenceTableInfoList() As DiseaseFilterValues

        If Not CanGetList() Then
            Throw New System.Security.SecurityException("You do not have permission to view a list of maintainable reference tables")
        End If

        Return DataPortal.Fetch(Of DiseaseFilterValues)(New Criteria(GetType(DiseaseFilterValues)))

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    Protected Overrides Sub DataPortal_Fetch(ByVal criteria As Object)

        RaiseListChangedEvents = False
        IsReadOnly = False

        Dim db As ServiceContracts.IDiseaseRankingService = DataFactory.GetDiseaseReferenceValueService
        Dim referenceTables As List(Of DataContracts.DiseaseFilterNameValues) = db.GetDiseaseDropReferenceTables()

        For Each referenceTable As DataContracts.DiseaseFilterNameValues In referenceTables
            Add(New NameValuePair(referenceTable.Id, FormatName(referenceTable.Name)))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True
    End Sub

    Public Shared Function FormatName(ByVal nameToFormat As String) As String

        nameToFormat = nameToFormat.Replace("&nbsp;", " ").StripPTags.Trim

        If nameToFormat.Length > 1 Then
            If nameToFormat.Substring(0, 1) = "<" Then
                Dim i As Integer = nameToFormat.IndexOf(">")

                nameToFormat = nameToFormat.Substring(0, i + 1) & UCase(nameToFormat.Substring(i + 1, 1)) & LCase(nameToFormat.Substring(i + 2, nameToFormat.Length - (i + 2)))
            Else
                nameToFormat = UCase(nameToFormat.Substring(0, 1)) & LCase(nameToFormat.Substring(1, nameToFormat.Length - 1))
            End If
        Else
            nameToFormat = UCase(nameToFormat)
        End If

        Return nameToFormat
    End Function

#End Region

End Class
