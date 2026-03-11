Public Module RegexPatterns

    Public ReadOnly Property Username() As String
        Get
            Return "^\w+([-.]\w+)*\\[\w-]+([\. ][\w-]+)*"
        End Get
    End Property

End Module
