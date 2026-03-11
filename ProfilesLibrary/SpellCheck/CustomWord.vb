Imports Csla
Imports Profiles.Contracts

Public Class CustomWord
    Inherits BusinessBase(Of CustomWord)

    Private mId As Guid
    Private mWord As String
    Private mLastUpdated(7) As Byte

    Public ReadOnly Property Id() As Guid
        Get
            CanReadProperty(True)
            Return mId
        End Get
    End Property

    Public Property Word() As String
        Get
            CanReadProperty(True)
            Return mWord
        End Get
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mWord <> value Then
                mWord = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property LastUpdated() As Byte()
        Get
            Return mLastUpdated
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId.ToString()
    End Function

    Public Shared Function NewCustomWord(ByVal word As String) As CustomWord
        Return New CustomWord(word)
    End Function

    Friend Shared Function GetCustomWord(ByVal wordData As DataContracts.CustomWord) As CustomWord
        Return New CustomWord(wordData)
    End Function

    Private Sub New(ByVal word As String)
        mId = Guid.NewGuid()
        mWord = word
        MarkAsChild()
    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Sub New(ByVal wordData As DataContracts.CustomWord)
        MarkAsChild()
        Fetch(wordData)
    End Sub

    Private Sub Fetch(ByVal wordData As DataContracts.CustomWord)
        mId = wordData.Id
        mWord = wordData.Word
        mLastUpdated = wordData.LastUpdated
        MarkOld()
    End Sub

    Friend Function GetDelete() As DataContracts.CustomWordDelete

        Return New DataContracts.CustomWordDelete With {.Id = mId}

    End Function

    Friend Function GetInsert() As DataContracts.CustomWordInsert

        Return New DataContracts.CustomWordInsert With { _
            .Id = mId, _
            .Word = mWord _
        }

    End Function

    Friend Function GetUpdate() As DataContracts.CustomWordUpdate

        Return New DataContracts.CustomWordUpdate With { _
            .Id = mId, _
            .Word = mWord, _
            .LastUpdated = mLastUpdated _
        }

    End Function

    Friend Sub DeleteSelf()
        MarkNew()
    End Sub

    Friend Sub Insert(ByVal newId As Guid, ByVal newLastUpdated As Byte())
        mId = newId
        mLastUpdated = newLastUpdated
        MarkOld()
    End Sub

    Friend Sub Update(ByVal newLastUpdated As Byte())
        mLastUpdated = newLastUpdated
        MarkOld()
    End Sub

End Class
