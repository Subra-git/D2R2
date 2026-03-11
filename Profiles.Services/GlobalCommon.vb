Module GlobalCommon

    Public Function TimestampsEqual(ByVal firstTimestamp As Byte(), ByVal secondTimestamp As Byte()) As Boolean

        If firstTimestamp.Length <> 8 OrElse secondTimestamp.Length <> 8 Then
            Throw New ArgumentException("A timestamp value must be 8 bytes long")
        End If

        For currentByte As Integer = 0 To 7
            If firstTimestamp(currentByte) <> secondTimestamp(currentByte) Then
                Return False
            End If
        Next

        Return True

    End Function

End Module
