Imports Csla
Imports System.Data.SqlClient

<Serializable()> _
Public Class EmailUserInfoList
    Inherits ReadOnlyListBase(Of EmailUserInfoList, EmailUserInfo)

    Private mDictionary As New Dictionary(Of Guid, EmailUserInfo)

#Region " Authorization Rules "

    Public Shared Function CanGetEmailInfoList() As Boolean

        Return True

    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetEmailInfoList() As EmailUserInfoList

        If Not CanGetEmailInfoList() Then
            Throw New System.Security.SecurityException("You do not have permission to get the list of Email User Infos.")
        End If

        Return DataPortal.Fetch(Of EmailUserInfoList)(Nothing)

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Object)

        RaiseListChangedEvents = False
        IsReadOnly = False

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgaReviewEmail"
                Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read
                        Dim currentEmailUserInfo As EmailUserInfo = EmailUserInfo.GetEmailInfo(reader)
                        Me.Add(currentEmailUserInfo)
                        mDictionary.Add(currentEmailUserInfo.UserId, currentEmailUserInfo)
                    End While

                    If reader.NextResult Then
                        While reader.Read
                            Dim userId As Guid = reader.GetGuid(0)
                            Dim currentEmailUserInfo As EmailUserInfo = mDictionary(userId)
                            currentEmailUserInfo.ProfileInfoList.AddProfileInfo(ProfileInfo.GetProfileInfo(reader))
                        End While
                    End If

                    If reader.NextResult Then
                        While reader.Read
                            Dim userId As Guid = reader.GetGuid(0)
                            Dim profileId As Guid = reader.GetGuid(1)
                            Dim currentEmailUserInfo As EmailUserInfo = mDictionary(userId)
                            Dim currentProfileInfo As ProfileInfo = currentEmailUserInfo.ProfileInfoList.GetById(profileId)
                            currentProfileInfo.SectionInfoList.AddSectionInfo(SectionInfo.GetSectionInfo(reader))
                        End While
                    End If

                End Using
            End Using
        End Using

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class


