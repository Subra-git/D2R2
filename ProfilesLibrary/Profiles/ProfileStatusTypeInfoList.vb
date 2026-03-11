Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileStatusTypeInfoList
    Inherits ReadOnlyListBase(Of ProfileStatusTypeInfoList, ProfileStatusTypeInfo)

    Private Shared mList As ProfileStatusTypeInfoList

#Region " Business Methods "

    Public Function GetById(ByVal id As Guid) As ProfileStatusTypeInfo

        For Each item As ProfileStatusTypeInfo In mList

            If item.Id = id Then
                Return item
            End If

        Next

        Return Nothing

    End Function

#End Region

#Region " Authorisation Methods "

    Private Shared Function CanGetProfileStatusTypeInfoList() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        If identity.IsUserManagementSystem Then
            Return False
        Else
            Return True
        End If

    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetProfileStatusTypeInfoList() As ProfileStatusTypeInfoList

        If Not CanGetProfileStatusTypeInfoList() Then
            Throw New System.Security.SecurityException("You do not have permission to get the profile status type list. ")
        End If

        If mList Is Nothing Then
            mList = DataPortal.Fetch(Of ProfileStatusTypeInfoList)(Nothing)
        End If

        Return mList

    End Function

    Private Sub New()
        'requires use of factory 
    End Sub

#End Region

#Region " Data Access "

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Object)

        RaiseListChangedEvents = False
        IsReadOnly = False

        Dim db As ServiceContracts.IProfileManagementService = DataFactory.GetProfileManagementService

        Dim dtoProfileStatusTypes As List(Of DataContracts.ProfileStatusType) = db.GetProfileStatusTypes()

        For Each dtoProfileStatusType As DataContracts.ProfileStatusType In dtoProfileStatusTypes
            Me.Add(ProfileStatusTypeInfo.GetProfileStatusTypeInfo(dtoProfileStatusType))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
