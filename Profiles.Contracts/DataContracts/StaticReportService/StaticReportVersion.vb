Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class StaticReportVersion

        Private mId As Guid
        Private mStaticReportId As Guid
        Private mTitle As String
        Private mVersionMajor As Byte
        Private mEffectiveDateFrom As Date
        Private mEffectiveDateTo As Date
        Private mIsCurrent As Boolean
        Private mIsUserManual As Boolean
        Private mIsPublic As Boolean
        Private mFileSize As Integer

        <DataMember()> _
        Public Property Id() As Guid
            Get
                Return mId
            End Get
            Private Set(ByVal value As Guid)
                mId = value
            End Set
        End Property

        <DataMember()> _
        Public Property StaticReportId() As Guid
            Get
                Return mStaticReportId
            End Get
            Private Set(ByVal value As Guid)
                mStaticReportId = value
            End Set
        End Property

        <DataMember()> _
        Public Property Title() As String
            Get
                Return mTitle
            End Get
            Private Set(ByVal value As String)
                mTitle = value
            End Set
        End Property

        <DataMember()> _
        Public Property VersionMajor() As Byte
            Get
                Return mVersionMajor
            End Get
            Private Set(ByVal value As Byte)
                mVersionMajor = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsCurrent() As Boolean
            Get
                Return mIsCurrent
            End Get
            Private Set(ByVal value As Boolean)
                mIsCurrent = value
            End Set
        End Property

        <DataMember()> _
        Public Property EffectiveDateFrom() As Date
            Get
                Return mEffectiveDateFrom
            End Get
            Private Set(ByVal value As Date)
                mEffectiveDateFrom = value
            End Set
        End Property

        <DataMember()> _
        Public Property EffectiveDateTo() As Date
            Get
                Return mEffectiveDateTo
            End Get
            Private Set(ByVal value As Date)
                mEffectiveDateTo = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsUserManual() As Boolean
            Get
                Return mIsUserManual
            End Get
            Private Set(ByVal value As Boolean)
                mIsUserManual = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsPublic() As Boolean
            Get
                Return mIsPublic
            End Get
            Private Set(ByVal value As Boolean)
                mIsPublic = value
            End Set
        End Property

        <DataMember()> _
       Public Property FileSize() As Integer
            Get
                Return mFileSize
            End Get
            Private Set(ByVal value As Integer)
                mFileSize = value
            End Set
        End Property

        Public Sub New(ByVal id As Guid, _
                       ByVal staticReportId As Guid, _
                       ByVal title As String, _
                       ByVal versionMajor As Byte, _
                       ByVal effectiveDateFrom As Date, _
                       ByVal effectiveDateTo As Date, _
                       ByVal isCurrent As Boolean, _
                       ByVal isUserManual As Boolean, _
                       ByVal isPublic As Boolean, _
                       ByVal fileSize As Integer)

            mId = id
            mStaticReportId = staticReportId
            mTitle = title
            mVersionMajor = versionMajor
            mEffectiveDateFrom = effectiveDateFrom
            mEffectiveDateTo = effectiveDateTo
            mIsCurrent = isCurrent
            mIsUserManual = isUserManual
            mIsPublic = isPublic
            mFileSize = fileSize

        End Sub

    End Class

End Namespace

