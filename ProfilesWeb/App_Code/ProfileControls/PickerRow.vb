Imports Microsoft.VisualBasic
Imports System.Collections.Generic

Namespace ProfilesWeb.Controls

    Public Class PickerRow
        Inherits WebControl
        Implements INamingContainer

        Private mRowText As String        
        Private mRowCheckBox As CheckBox
        Private mVisible As Boolean = True
        Private mRowId As String

        Public Property RowId() As String
            Get
                Return mRowId
            End Get
            Set(ByVal value As String)
                mRowId = value
            End Set
        End Property

        Public Property RowText() As String
            Get
                Return mRowText
            End Get
            Set(ByVal value As String)
                mRowText = value
            End Set
        End Property

        Public Overrides Property Visible() As Boolean
            Get
                If Not ViewState("Visible") Is Nothing Then
                    mVisible = CBool(ViewState("Visible"))
                End If
                Return mVisible
            End Get
            Set(ByVal value As Boolean)
                mVisible = value
                ViewState("Visible") = mVisible
            End Set
        End Property

        Public ReadOnly Property RowCheckBox() As CheckBox
            Get
                Return mRowCheckBox
            End Get
        End Property

        Public Property Checked() As Boolean
            Get
                Return mRowCheckBox.Checked
            End Get
            Set(ByVal value As Boolean)
                mRowCheckBox.Checked = value
            End Set
        End Property

        Public Overrides ReadOnly Property Controls() As System.Web.UI.ControlCollection
            Get
                EnsureChildControls()
                Return MyBase.Controls
            End Get
        End Property

        Protected Overrides Sub CreateChildControls()
            Controls.Clear()

            mRowCheckBox = New CheckBox()
            mRowCheckBox.ID = "chkOption_" + mRowId
            mRowCheckBox.AutoPostBack = True
            AddHandler mRowCheckBox.CheckedChanged, AddressOf RowCheckBox_CheckedChanged
            Me.Controls.Add(mRowCheckBox)
        End Sub

        Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
            If mVisible Then

                writer.RenderBeginTag(HtmlTextWriterTag.Table)
                writer.RenderBeginTag(HtmlTextWriterTag.Tr)
                writer.AddStyleAttribute(HtmlTextWriterStyle.Padding, "0px")
                writer.AddStyleAttribute(HtmlTextWriterStyle.Margin, "0px")
                writer.RenderBeginTag(HtmlTextWriterTag.Td)               
                mRowCheckBox.RenderControl(writer)
                writer.RenderEndTag() 'Td
                writer.AddStyleAttribute(HtmlTextWriterStyle.Padding, "0px")
                writer.AddStyleAttribute(HtmlTextWriterStyle.Margin, "0px")
                writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
                writer.AddAttribute(HtmlTextWriterAttribute.Class, "menulinkdesc")
                writer.RenderBeginTag(HtmlTextWriterTag.Td)
                writer.Write(mRowText)
                writer.RenderEndTag() 'Td
                writer.RenderEndTag() 'Tr
                writer.RenderEndTag() 'Table
            End If
        End Sub

        Public Event RowCheckBoxChanged As EventHandler

        Protected Sub RowCheckBox_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
            RaiseEvent RowCheckBoxChanged(sender, e)
        End Sub


    End Class
End Namespace
