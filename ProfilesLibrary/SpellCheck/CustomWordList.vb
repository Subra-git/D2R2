Imports Csla
Imports Profiles.Contracts

Public Class CustomWordList
    Inherits BusinessListBase(Of CustomWordList, CustomWord)

    Public Function GetById(ByVal wordId As Guid) As CustomWord
        For Each currentWord As CustomWord In Me
            If currentWord.Id.Equals(wordId) Then
                Return currentWord
            End If
        Next
        Return Nothing
    End Function

#Region " Authorization Rules "

    Public Shared Function CanGetCustomWordList() As Boolean

        If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
            Return False
        End If

        Return Csla.ApplicationContext.User.Identity.IsAuthenticated
    End Function

    Public Shared Function CanEditCustomWordList() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        If identity.IsUserManagementSystem Then
            Return False
        End If

        Return identity.IsProfileEditor OrElse identity.IsContributorOrReviewer
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetCustomWordList() As CustomWordList
        If Not CanGetCustomWordList() Then
            Throw New System.Security.SecurityException("You do not have permission to view the words in the custom dictionary")
        End If
        Return DataPortal.Fetch(Of CustomWordList)(New Criteria())

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Public Overrides Function Save() As CustomWordList
        If Not CanEditCustomWordList() Then
            Throw New System.Security.SecurityException("You do not have permission to edit the words in the custom dictionary")
        End If
        Return MyBase.Save()
    End Function
#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria
        Public Sub New()
        End Sub
    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        Dim db As ServiceContracts.ISpellCheckService = DataFactory.GetSpellCheckService()
        Dim customWords As List(Of DataContracts.CustomWord) = db.GetCustomWords()

        RaiseListChangedEvents = False

        For Each word As DataContracts.CustomWord In customWords
            Add(CustomWord.GetCustomWord(word))
        Next

        RaiseListChangedEvents = True

    End Sub

    Protected Overrides Sub DataPortal_Update()

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Dim db As ServiceContracts.ISpellCheckService = DataFactory.GetSpellCheckService()
        Dim changeset As New DataContracts.CustomWordChangeset()

        Dim updateRequired As Boolean

        For Each item As CustomWord In DeletedList
            changeset.DeleteList.Add(item.GetDelete())
            updateRequired = True
        Next

        For Each item As CustomWord In Me
            If item.IsDirty Then
                If item.IsNew Then
                    changeset.InsertList.Add(item.GetInsert())
                Else
                    changeset.UpdateList.Add(item.GetUpdate())
                End If
                updateRequired = True
            End If
        Next

        If updateRequired Then
            Dim result As DataContracts.ChangeResult = db.UpdateCustomWords(changeset)
            Dim currentInsert As Integer
            Dim currentUpdate As Integer
            RaiseListChangedEvents = False

            For Each item As CustomWord In DeletedList
                item.DeleteSelf()
            Next

            For Each item As CustomWord In Me
                If item.IsDirty Then
                    If item.IsNew Then
                        item.Insert(result.IdInsertList(currentInsert), result.LastUpdatedInsertList(currentInsert))
                        currentInsert += 1
                    Else
                        item.Update(result.LastUpdatedUpdateList(currentUpdate))
                        currentUpdate += 1
                    End If
                End If
            Next

            RaiseListChangedEvents = True

        End If

    End Sub

#End Region

End Class
