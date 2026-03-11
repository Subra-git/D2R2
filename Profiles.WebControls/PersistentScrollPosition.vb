Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Reflection
Imports System.Web.UI.WebControls


<DefaultProperty("ControlToPersist")> _
<ToolboxData("<{0}:PersistentScrollPosition runat=""server"" ControlToPersist="""" />")> _
<NonVisualControl()> _
Public Class PersistentScrollPosition
    Inherits Control
    Implements IScriptControl
    Implements INamingContainer

#Region " Internal Members "
    Private mSm As ScriptManager = Nothing
    Private mControl As Control = Nothing
    Private mStorage As HiddenField
#End Region

#Region " Ctor(s) "
    ''' <summary>
    ''' Initializes a new instance of the <see cref="PersistentScrollPosition"/> class.
    ''' </summary>
    Public Sub PersistentScrollPosition()

    End Sub
#End Region

#Region " Base Class Overrides "
    Protected Overrides Sub OnInit(ByVal e As EventArgs)

        MyBase.OnInit(e)

        ' Create hidden control for storage
        mStorage = New HiddenField()
        mStorage.ID = "storage"
        Controls.Add(mStorage)

    End Sub

    Protected Overrides Sub OnPreRender(ByVal e As EventArgs)

        If (Not Me.DesignMode) Then
            scrollScriptManager.RegisterScriptControl(Me)
        End If

        MyBase.OnPreRender(e)
    End Sub

    Protected Overrides Sub Render(ByVal writer As HtmlTextWriter)

        If (Not Me.DesignMode) Then
            scrollScriptManager.RegisterScriptDescriptors(Me)
        End If

        MyBase.Render(writer)
    End Sub

    '[Browsable(false),
    'DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden),
    'EditorBrowsable(EditorBrowsableState.Never)]
    Public Overrides Property Visible() As Boolean
        Get
            Return MyBase.Visible
        End Get
        Set(ByVal value As Boolean)
            MyBase.Visible = value
        End Set
    End Property
#End Region

#Region " Properties "
    ''' <summary>
    ''' Gets or sets the control to persist.
    ''' </summary>
    ''' <value>The control to persist.</value>
    Public Property ControlToPersist() As String
        Get
            Dim o As Object = ViewState("ControlToPersist")
            If Not o Is Nothing Then
                Return o.ToString()
            Else
                Return String.Empty
            End If
        End Get
        Set(ByVal value As String)
            ViewState("ControlToPersist") = value
        End Set
    End Property

    ''' <summary>
    ''' Gets the script manager
    ''' </summary>
    ''' <value>The script manager</value>
    Friend ReadOnly Property scrollScriptManager() As ScriptManager
        Get
            If mSm Is Nothing Then
                Dim currentPage As Page = Page
                If currentPage Is Nothing Then
                    Throw New InvalidOperationException("Page cannot be nothing")
                End If

                mSm = ScriptManager.GetCurrent(currentPage)
                If mSm Is Nothing Then
                    Throw New InvalidOperationException("A ScriptManager is required")
                End If
            End If
            Return mSm
        End Get
    End Property

    ''' <summary>
    ''' Gets the control.
    ''' </summary>
    ''' <value>The control.</value>
    Protected Friend ReadOnly Property scrollControl() As Control
        Get
            If mControl Is Nothing Then
                Dim currentPage As Page = Page
                If currentPage Is Nothing Then
                    Throw New InvalidOperationException("Page cannot be null")
                End If
                mControl = DirectCast(FindControlRecursive(Page, ControlToPersist), Control)
                If mControl Is Nothing Then
                    Throw New InvalidOperationException("Could not located the specified control")
                End If

            End If
            Return mControl
        End Get
    End Property

#End Region

#Region " IScriptControl Members "

    Public Function GetScriptDescriptors() As System.Collections.Generic.IEnumerable(Of System.Web.UI.ScriptDescriptor) Implements System.Web.UI.IScriptControl.GetScriptDescriptors

        Dim scd As ScriptComponentDescriptor = New ScriptBehaviorDescriptor("Profiles.WebControls.PersistentScrollPosition", scrollControl.ClientID)
        scd.AddElementProperty("storage", mStorage.ClientID)

        Dim scriptDespList As New List(Of ScriptDescriptor)

        scriptDespList.Add(scd)
        Return scriptDespList

    End Function

    Public Function GetScriptReferences() As System.Collections.Generic.IEnumerable(Of System.Web.UI.ScriptReference) Implements System.Web.UI.IScriptControl.GetScriptReferences

        Dim scriptRefList As New List(Of ScriptReference)
        Dim scr As ScriptReference
        scr = New ScriptReference("Profiles.WebControls.PersistentScrollBar.js", Assembly.GetAssembly(Me.GetType()).FullName)
        scriptRefList.Add(scr)

        Return scriptRefList

    End Function

#End Region

#Region " Helper "
    ''' <summary>
    ''' Finds the control
    ''' </summary>
    ''' <param name="root">The root control to search.</param>
    ''' <param name="id">The id.</param>
    ''' <returns></returns>
    Protected Overridable Function FindControlRecursive(ByVal root As Control, ByVal id As String) As Control

        If root.ID = id Then
            Return root
        End If

        For Each c As Control In root.Controls
            Dim t As Control = FindControlRecursive(c, id)

            If Not t Is Nothing Then
                Return t
            End If
        Next
        Return Nothing

    End Function

#End Region

End Class

