Imports Csla

<Serializable()> _
Public MustInherit Class PrioritisationMetadataBase
    Inherits BusinessBase(Of PrioritisationMetadataBase)

#Region " Business Methods "

    Protected mIdValue As Guid = Guid.Empty
    Protected mLastUpdated(7) As Byte

    Protected Overrides Function GetIdValue() As Object
        If mIdValue = Guid.Empty Then
            mIdValue = Guid.NewGuid
        End If
        Return mIdValue
    End Function

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Globalization", "CA1303:DoNotPassLiteralsAsLocalizedParameters", MessageId:="System.Security.SecurityException.#ctor(System.String)")> _
    Public Overrides Function Save() As PrioritisationMetadataBase
        If Not CanEditObject() Then
            Throw New System.Security.SecurityException("You do not have permission to edit prioritisation variables.")
        End If

        Return MyBase.Save()
    End Function

#End Region

#Region " Authorization Rules "

    Public Shared Function CanGetObject() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

    Public Shared Function CanEditObject() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

#End Region

End Class
