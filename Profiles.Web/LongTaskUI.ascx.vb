
Partial Class LongTaskUI
    Inherits System.Web.UI.UserControl

    Public Delegate Function LongRunningTaskDelegate() As String
    Public Event TaskCompleted As EventHandler(Of TaskCompletedEventArgs)

    Public Property ProgressMessage() As String
        Get
            Return lblProgressMessage.Text
        End Get
        Set(ByVal value As String)
            lblProgressMessage.Text = value
        End Set
    End Property

    Protected Property LongRunningTaskHandle() As IAsyncResult
        Get
            If Session("LongRunningTaskHandle|" & Me.UniqueID) Is Nothing Then
                Return Nothing
            End If
            Return DirectCast(Session("LongRunningTaskHandle|" & Me.UniqueID), IAsyncResult)
        End Get
        Set(ByVal value As IAsyncResult)
            Session("LongRunningTaskHandle|" & Me.UniqueID) = value
        End Set
    End Property

    Protected Property LongRunningTaskResult() As String
        Get
            If Session("LongRunningTaskResult|" & Me.UniqueID) Is Nothing Then
                Return String.Empty
            End If
            Return DirectCast(Session("LongRunningTaskResult|" & Me.UniqueID), String)
        End Get
        Set(ByVal value As String)
            Session("LongRunningTaskResult|" & Me.UniqueID) = value
        End Set
    End Property

    Protected Overridable Sub OnTaskCompleted(ByVal e As TaskCompletedEventArgs)
        RaiseEvent TaskCompleted(Me, e)
    End Sub

    Public Sub StartTask(ByVal run As LongRunningTaskDelegate)
        LongRunningTaskHandle = run.BeginInvoke(New AsyncCallback(AddressOf CallbackMethod), Nothing)
        LongRunningTaskResult = String.Empty
        ModalPopupExtender.Show()
        tmrLongTask.Enabled = True
    End Sub

    Private Sub CallbackMethod(ByVal result As IAsyncResult)

        Dim async As Runtime.Remoting.Messaging.AsyncResult = DirectCast(result, Runtime.Remoting.Messaging.AsyncResult)
        Dim run As LongRunningTaskDelegate = async.AsyncDelegate
        LongRunningTaskResult = run.EndInvoke(async)

    End Sub

    Protected Sub tmrLongTask_Tick(ByVal sender As Object, ByVal e As System.EventArgs)
        If LongRunningTaskHandle.IsCompleted Then
            OnTaskCompleted(New TaskCompletedEventArgs(LongRunningTaskResult))
            tmrLongTask.Enabled = False
            ModalPopupExtender.Hide()
        Else
            tmrLongTask.Enabled = True
            ModalPopupExtender.Show()
        End If
    End Sub

End Class

Public Class TaskCompletedEventArgs
    Inherits EventArgs

    Private mResult As String

    Public ReadOnly Property Result() As String
        Get
            Return mResult
        End Get
    End Property

    Public Sub New(ByVal result As String)
        mResult = result
    End Sub
End Class
