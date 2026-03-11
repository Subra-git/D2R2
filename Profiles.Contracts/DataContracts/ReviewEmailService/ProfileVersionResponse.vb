Imports System.Runtime.Serialization

Namespace DataContracts

    Public Class ProfileVersionResponse

        Private mScenarioTitle As String
        Private mProfileTitle As String
        Private mFullVersion As String
        Private mProfileVersionId As Guid
        Private mProfileSections As List(Of ProfileSectionResponse)

        <DataMember()>
        Public Property ScenarioTitle() As String
            Get
                Return mScenarioTitle
            End Get
            Set(ByVal value As String)
                mScenarioTitle = value
            End Set
        End Property

        <DataMember()>
        Public Property ProfileTitle() As String
            Get
                Return mProfileTitle
            End Get
            Set(ByVal value As String)
                mProfileTitle = value
            End Set
        End Property

        <DataMember()>
        Public Property FullVersion() As String
            Get
                Return mFullVersion
            End Get
            Set(ByVal value As String)
                mFullVersion = value
            End Set
        End Property

        <DataMember()>
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        <DataMember>
        Public Property ProfileSections() As List(Of ProfileSectionResponse)
            Get 
                Return mProfileSections
            End Get
            Set(value As List(Of ProfileSectionResponse))
                mProfileSections = value
            End Set
        End Property

    End Class

End Namespace
