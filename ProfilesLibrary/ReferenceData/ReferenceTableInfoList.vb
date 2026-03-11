Imports Csla
Imports Profiles.Contracts

<Serializable()>
Public Class ReferenceTableInfoList
    Inherits NameValueListBase(Of Guid, String)

    Public Shared Function CanGetList() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor
    End Function

#Region " Factory Methods "

    Public Shared Function GetReferenceTableInfoList() As ReferenceTableInfoList

        If Not CanGetList() Then
            Throw New System.Security.SecurityException("You do not have permission to view a list of maintainable reference tables")
        End If

        Return DataPortal.Fetch(Of ReferenceTableInfoList)(New Criteria(GetType(ReferenceTableInfoList)))

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    Protected Overrides Sub DataPortal_Fetch(ByVal criteria As Object)

        RaiseListChangedEvents = False
        IsReadOnly = False

        Dim db As ServiceContracts.IReferenceValueService = DataFactory.GetReferenceValueService
        Dim referenceTables As List(Of DataContracts.ReferenceTable) = db.GetMaintainableReferenceTables()

        For Each referenceTable As DataContracts.ReferenceTable In referenceTables
            Add(New NameValueListBase(Of Guid, String).NameValuePair(referenceTable.Id, FormatName(referenceTable.Name)))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True
    End Sub

    Private Function FormatName(ByVal name As String) As String
        Return name.Substring(0, 1) & name.Substring(1).ToLower()
    End Function

#End Region

End Class