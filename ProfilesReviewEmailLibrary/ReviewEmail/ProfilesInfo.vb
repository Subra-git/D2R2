Imports Csla
Imports Csla.Data

<Serializable()> _
Public Class ProfileInfo
    Inherits ReadOnlyBase(Of ProfileInfo)

    Private mProfileVersionId As Guid
    Private mProfileTitle As String
    Private mScenarioTitle As String
    Private mVersionMajor As Byte
    Private mVersionMinor As Byte
    Private mSectionInfoList As SectionInfoList

#Region " Business Methods "

    Public ReadOnly Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
    End Property

    Public ReadOnly Property ProfileTitle() As String
        Get
            Return mProfileTitle
        End Get
    End Property

    Public ReadOnly Property ScenarioTitle() As String
        Get
            Return mScenarioTitle
        End Get
    End Property
    
    Public ReadOnly Property VersionMajor() As String
        Get
            Return mVersionMajor.ToString()
        End Get
    End Property

    Public ReadOnly Property VersionMinor() As String
        Get
            Return mVersionMinor.ToString()
        End Get
    End Property

    Public ReadOnly Property FullVersion() As String
        Get
            Return mVersionMajor.ToString() & "." & mVersionMinor.ToString()
        End Get
    End Property

    Public ReadOnly Property SectionInfoList() As SectionInfoList
        Get
            Return mSectionInfoList
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mProfileVersionId.ToString()
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetProfileInfo(ByVal reader As SafeDataReader) As ProfileInfo
        Return New ProfileInfo(reader)
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal reader As SafeDataReader)
        Fetch(reader)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal reader As SafeDataReader)
        mProfileVersionId = reader.GetGuid(1)
        mProfileTitle = reader.GetString(2)
        mScenarioTitle = reader.GetString(3)
        mVersionMinor = reader.GetByte(4)
        mVersionMajor = reader.GetByte(5)
        mSectionInfoList = SectionInfoList.NewSectionInfoList()
    End Sub

#End Region

End Class
