Imports Microsoft.VisualBasic
Imports System
Imports System.Web
Imports System.Collections
Imports Telerik.WebControls
Imports ProfilesLibrary

Namespace Profiles.WebControls

    Public Class CustomWordSource
        Implements ICustomDictionarySource
        Private mPosition As Integer = 0
        Private mWordList As CustomWordList

        Public Sub New()
            '
        End Sub

        Private ReadOnly Property WordList() As CustomWordList
            Get
                If mWordList Is Nothing Then
                    mWordList = CustomWordList.GetCustomWordList()
                End If
                Return mWordList
            End Get
        End Property

        Public Sub AddWord(ByVal word As String) Implements Telerik.WebControls.ICustomDictionarySource.AddWord

            Try
                'the radSpell control calls this method on a separate thread, so we need to authenticate on this thread
                Authenticate()

                WordList.Add(CustomWord.NewCustomWord(word))
                WordList.Save()
            Catch ex As Exception
                WriteToErrorLog(ex)
            End Try

        End Sub

        Public Property CustomAppendix() As String Implements Telerik.WebControls.ICustomDictionarySource.CustomAppendix
            Get
                Return String.Empty
            End Get
            Set(ByVal value As String)
                '
            End Set
        End Property

        Public Property DictionaryPath() As String Implements Telerik.WebControls.ICustomDictionarySource.DictionaryPath
            Get
                Return String.Empty
            End Get
            Set(ByVal value As String)
                '
            End Set
        End Property

        Public Property Language() As String Implements Telerik.WebControls.ICustomDictionarySource.Language
            Get
                Return String.Empty
            End Get
            Set(ByVal value As String)
                '
            End Set
        End Property

        Public Function ReadWord() As String Implements Telerik.WebControls.ICustomDictionarySource.ReadWord

            Try
                'the radSpell control calls this method on a separate thread, so we need to authenticate on this thread
                Authenticate()

                If mPosition >= WordList.Count Then
                    Return Nothing
                End If

                Dim currentWord As String = WordList(mPosition).Word
                mPosition += 1
                Return currentWord

            Catch ex As Exception
                WriteToErrorLog(ex)
                Return Nothing
            End Try

        End Function

        Private Sub Authenticate()

            If HttpContext.Current.User.Identity.AuthenticationType <> "Csla" AndAlso HttpContext.Current.User.Identity.IsAuthenticated Then

                Dim name As String = HttpContext.Current.User.Identity.Name
                If HttpContext.Current.User.Identity.AuthenticationType <> "Forms" Then
                    ProfilesPrincipal.Logout()
                    ProfilesPrincipal.Login(name)
                Else
                    ProfilesPrincipal.Logout(New Guid(name))
                    ProfilesPrincipal.Login(New Guid(name), New Guid(name))
                End If
            End If

        End Sub

        Private Sub WriteToErrorLog(ByVal ex As Exception)
            Try
                Dim logEntry As ErrorLogEntry = ErrorLogEntry.NewErrorLogEntry(ex)
                If HttpContext.Current IsNot Nothing AndAlso HttpContext.Current.Request IsNot Nothing Then
                    logEntry.Request = HttpContext.Current.Request.Url.ToString()
                End If
                logEntry.Save()
            Catch
                'Do nothing
            End Try
        End Sub

    End Class

End Namespace