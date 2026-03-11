Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileStatusTypeInfo
    Inherits ReadOnlyBase(Of ProfileStatusTypeInfo)

    Private mId As Guid
    Private mName As String
    Private mIsValidationComplete As Boolean

#Region " Business Methods "

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

    Public ReadOnly Property IsValidationComplete() As Boolean
        Get
            Return mIsValidationComplete
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId.ToString()
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetProfileStatusTypeInfo(ByVal dtoProfileStatusType As DataContracts.ProfileStatusType) As ProfileStatusTypeInfo
        Return New ProfileStatusTypeInfo(dtoProfileStatusType)
    End Function

    Private Sub New()
        'requires use of factory method
    End Sub

    Private Sub New(ByVal dtoProfileStatusType As DataContracts.ProfileStatusType)
        Fetch(dtoProfileStatusType)        
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoProfileStatusType As DataContracts.ProfileStatusType)

        mId = dtoProfileStatusType.Id
        mName = dtoProfileStatusType.Name
        mIsValidationComplete = dtoProfileStatusType.IsValidationComplete

    End Sub

#End Region

End Class
