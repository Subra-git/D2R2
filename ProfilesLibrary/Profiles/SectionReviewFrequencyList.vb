Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SectionReviewFrequencyList
    Inherits NameValueListBase(Of Guid, String)

    Private Shared mList As SectionReviewFrequencyList

    Public Shared Function CanGetList() As Boolean
        Return Csla.ApplicationContext.User.Identity.IsAuthenticated
    End Function

#Region " Factory Methods "

    Public Shared Function GetList() As SectionReviewFrequencyList

        If Not CanGetList() Then
            Throw New System.Security.SecurityException("You do not have permission to view a list of section review frequencies.")
        End If

        If mList Is Nothing Then
            mList = DataPortal.Fetch(Of SectionReviewFrequencyList)(New Criteria(GetType(SectionReviewFrequencyList)))
        End If
        Return mList

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Public Shared Sub InvalidateCache()
        mList = Nothing
    End Sub

#End Region

#Region " Data Access "

    Protected Overrides Sub DataPortal_Fetch(ByVal criteria As Object)

        RaiseListChangedEvents = False
        IsReadOnly = False

        Dim db As ServiceContracts.IProfileVersionDataService = DataFactory.GetProfileVersionDataService()
        Dim reviewFrequencies As List(Of DataContracts.SectionReviewFrequency) = db.GetSectionReviewFrequencies()

        For Each reviewFrequency As DataContracts.SectionReviewFrequency In reviewFrequencies
            Add(New NameValueListBase(Of Guid, String).NameValuePair(reviewFrequency.Id, reviewFrequency.LookupValue))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class

