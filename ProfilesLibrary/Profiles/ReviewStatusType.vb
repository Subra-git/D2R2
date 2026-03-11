Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ReviewStatusType
    Inherits ReadOnlyBase(Of ReviewStatusType)

    Private mId As Guid
    Private mName As String

#Region " Busines Methods "

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property Name() As String
        Get
            Return mName
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId.ToString()
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetReviewStatusType(ByVal dtoReviewStatusType As DataContracts.SectionReviewStatusType) As ReviewStatusType
        Return New ReviewStatusType(dtoReviewStatusType)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoReviewStatusType As DataContracts.SectionReviewStatusType)
        Fetch(dtoReviewStatusType)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoReviewStatusType As DataContracts.SectionReviewStatusType)

        mId = dtoReviewStatusType.Id
        mName = dtoReviewStatusType.Name

    End Sub

#End Region



End Class
