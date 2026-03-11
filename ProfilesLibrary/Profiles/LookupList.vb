Imports Csla
Imports Profiles.Contracts

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> _
<Serializable()> _
Public Class LookupList
    Inherits NameValueListBase(Of Guid, String)

    Private Shared mLists As New Dictionary(Of Guid, LookupList)

    Private mMaxLookupValueLength As Integer

    Public ReadOnly Property MaxLookupValueLength() As Integer
        Get
            If mMaxLookupValueLength = 0 Then
                For Each lookupItem As LookupList.NameValuePair In Me
                    If lookupItem.Value.Length > mMaxLookupValueLength Then
                        mMaxLookupValueLength = lookupItem.Value.Length
                    End If
                Next
            End If
            Return mMaxLookupValueLength
        End Get
    End Property

#Region " Factory Methods "

    Private Sub New()
        ' require use of factory methods
    End Sub

    Public Shared Function GetList(ByVal referenceTableId As Guid) As LookupList
        If Not mLists.ContainsKey(referenceTableId) Then
            mLists.Add(referenceTableId, DataPortal.Fetch(Of LookupList)(New LookupCriteria(referenceTableId)))
        End If
        Return mLists(referenceTableId)
    End Function

    Public Shared Sub InvalidateCache(ByVal referenceTableId As Guid)
        mLists.Remove(referenceTableId)
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class LookupCriteria
        Private mReferenceTableId As Guid
        Public ReadOnly Property ReferenceTableId() As Guid
            Get
                Return mReferenceTableId
            End Get
        End Property
        Public Sub New(ByVal referenceTableId As Guid)
            mReferenceTableId = referenceTableId
        End Sub
    End Class

    Protected Overrides Sub DataPortal_Fetch(ByVal criteria As Object)

        RaiseListChangedEvents = False
        IsReadOnly = False
        Dim lookupCriteria As LookupCriteria = DirectCast(criteria, LookupCriteria)

        Dim db As ServiceContracts.IReferenceValueService = DataFactory.GetReferenceValueService()
        Dim lookupValues As List(Of DataContracts.LookupValue) = db.GetLookupValues( _
            New DataContracts.GetLookupValuesRequest(lookupCriteria.ReferenceTableId))

        For Each lookupValue As DataContracts.LookupValue In lookupValues
            Add(New NameValueListBase(Of Guid, String).NameValuePair(lookupValue.Id, lookupValue.LookupValue))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
