Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ReviewStatusTypeList
    Inherits ReadOnlyListBase(Of ReviewStatusTypeList, ReviewStatusType)

    Private Shared mList As ReviewStatusTypeList

#Region " Business Methods "

    Public Function GetById(ByVal id As Guid) As ReviewStatusType

        For Each item As ReviewStatusType In Me

            If item.Id = id Then
                Return item
            End If

        Next

        Return Nothing

    End Function

    Public Function GetByName(ByVal name As String) As ReviewStatusType

        For Each item As ReviewStatusType In Me

            If item.Name.ToLower() = name.ToLower() Then
                Return item
            End If

        Next

        Return Nothing

    End Function

#End Region

#Region " Authorisation Rules "

    Public Shared Function CanGetReviewStatusTypeListList() As Boolean

        Return Csla.ApplicationContext.User.Identity.IsAuthenticated

    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetReviewStatusTypeList() As ReviewStatusTypeList

        If Not CanGetReviewStatusTypeListList() Then
            Throw New System.Security.SecurityException("You do not have permission to view the review status type list.")
        End If

        If mList Is Nothing Then
            mList = DataPortal.Fetch(Of ReviewStatusTypeList)(Nothing)
        End If
        Return mList

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    Protected Overrides Sub DataPortal_Fetch(ByVal criteria As Object)

        RaiseListChangedEvents = False
        IsReadOnly = False

        Dim db As ServiceContracts.IProfileVersionDataService = DataFactory.GetProfileVersionDataService()
        Dim dtoReviewStatusTypeList As List(Of DataContracts.SectionReviewStatusType) = db.GetSectionReviewStatusTypes()

        For Each dtoReviewStatusType As DataContracts.SectionReviewStatusType In dtoReviewStatusTypeList

            Me.Add(ReviewStatusType.GetReviewStatusType(dtoReviewStatusType))

        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class

