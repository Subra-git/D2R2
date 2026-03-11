Public Class Accordion
    Inherits System.Web.UI.UserControl

    Private _buttonText As String = "Filter by affected species"
    Private _iconClass As String = "govuk-accordion-nav__chevron govuk-accordion-nav__chevron--down"
    Private _showText As String = "Show filter by affected species"
    Private _hideText As String = "Hide filter by affected species"
    Private _containerClass As String = ".species-selector-container"
    Private _containerId As String = "species-selector-container"

    Public Property ButtonText As String
        Get
            Return _buttonText
        End Get
        Set(value As String)
            _buttonText = value
        End Set
    End Property

    Public Property IconClass As String
        Get
            Return _iconClass
        End Get
        Set(value As String)
            _iconClass = value
        End Set
    End Property

    Public Property ShowText As String
        Get
            Return _showText
        End Get
        Set(value As String)
            _showText = value
        End Set
    End Property

    Public Property HideText As String
        Get
            Return _hideText
        End Get
        Set(value As String)
            _hideText = value
        End Set
    End Property

    Public Property ContainerClass As String
        Get
            Return _containerClass
        End Get
        Set(value As String)
            _containerClass = value
        End Set
    End Property

    Public Property ContainerId As String
        Get
            Return _containerId
        End Get
        Set(value As String)
            _containerId = value
        End Set
    End Property

    Public Function GetToggleScript() As String
        Return $"apha.searchPage.toggleSection(this, {{" &
               $"showText: '{ShowText}', hideText: '{HideText}', containerClass: '{ContainerClass}'}}); return false;"
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim toggleScript As String = $"apha.profiles.toggleSection(this, {{" &
                                 $"showText: '{HttpUtility.JavaScriptStringEncode(ShowText)}', " &
                                 $"hideText: '{HttpUtility.JavaScriptStringEncode(HideText)}', " &
                                 $"containerClass: '{HttpUtility.JavaScriptStringEncode(ContainerClass)}'}}); return false;"
        btnToggle.Attributes.Add("onclick", toggleScript)
        btnToggle.Attributes.Add("aria-controls", ContainerId)
    End Sub

End Class