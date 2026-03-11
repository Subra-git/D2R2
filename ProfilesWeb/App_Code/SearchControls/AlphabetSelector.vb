Imports System
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.ComponentModel
Imports Microsoft.VisualBasic

Namespace ProfilesWeb.Controls
    <DefaultEvent("ItemSelected")> _
    Public Class AlphabetSelector
        Inherits WebControl

        Private Const mAllText As String = "All"

        Public Event ItemSelected As EventHandler

        Protected Overridable Sub OnItemSelected(ByVal e As EventArgs)
            RaiseEvent ItemSelected(Me, e)
        End Sub

        Protected Overrides Sub OnInit(ByVal e As EventArgs)

            Me.Controls.Add(CreateLinkButton(mAllText))
            Me.Controls.Add(New LiteralControl("&nbsp;"))

            For currentChar As Integer = 65 To 90
                Me.Controls.Add(CreateLinkButton(Chr(currentChar).ToString()))
                Me.Controls.Add(New LiteralControl("&nbsp;"))
            Next

            MyBase.OnInit(e)

        End Sub

        Protected Overrides Sub OnPreRender(ByVal e As System.EventArgs)

            If FindControl(SelectedItem) IsNot Nothing Then
                DirectCast(FindControl(SelectedItem), LinkButton).Enabled = False
            End If

            MyBase.OnPreRender(e)

        End Sub

        Private Function CreateLinkButton(ByVal name As String) As LinkButton

            Dim letterButton As New LinkButton()
            letterButton.Text = name
            letterButton.CommandArgument = name
            AddHandler letterButton.Click, New EventHandler(AddressOf letterButton_Click)
            letterButton.ID = name

            Return letterButton

        End Function

        Public Property SelectedItem() As String
            Get
                If ViewState("SelectedItem") Is Nothing Then
                    Return mAllText
                Else
                    Return ViewState("SelectedItem").ToString()
                End If
            End Get
            Set(ByVal value As String)
                ViewState("SelectedItem") = value
            End Set
        End Property

        Private Sub letterButton_Click(ByVal sender As Object, ByVal e As EventArgs)

            Dim link As LinkButton = DirectCast(sender, LinkButton)

            If SelectedItem IsNot Nothing Then
                DirectCast(FindControl(SelectedItem), LinkButton).Enabled = True
            End If

            ViewState("SelectedItem") = link.CommandArgument
            link.Enabled = False

            OnItemSelected(EventArgs.Empty)

        End Sub

    End Class

End Namespace
