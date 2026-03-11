Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class RankProfileData

        Private mProfileId As Guid
        Private mProfileVersionId As Guid
        Private mSpeciesId As Guid
        Private mProfileTitle As String
        Private mSpeciesName As String
        Private mIsExotic As Boolean
        Private mPublicHealthRank As Integer
        Private mPublicHealthProfileVersionId As Guid
        Private mWelfareRank As Integer
        Private mWelfareProfileVersionId As Guid
        Private mWiderSocietyRank As Integer
        Private mWiderSocietyProfileVersionId As Guid
        Private mInternationalTradeRank As Integer
        Private mInternationalTradeProfileVersionId As Guid
        Private mPotentialToAddValueRank As Integer
        Private mPotentialToAddValueProfileVersionId As Guid
        Private mRiskRank As Integer
        Private mRiskProfileVersionId As Guid
        Private mIsAwaitingValidation As Boolean

        <DataMember()> _
        Public Property ProfileId() As Guid
            Get
                Return mProfileId
            End Get
            Set(ByVal value As Guid)
                mProfileId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property SpeciesId() As Guid
            Get
                Return mSpeciesId
            End Get
            Set(ByVal value As Guid)
                mSpeciesId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileTitle() As String
            Get
                Return mProfileTitle
            End Get
            Set(ByVal value As String)
                mProfileTitle = value
            End Set
        End Property

        <DataMember()> _
        Public Property SpeciesName() As String
            Get
                Return mSpeciesName
            End Get
            Set(ByVal value As String)
                mSpeciesName = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsExotic() As Boolean
            Get
                Return mIsExotic
            End Get
            Set(ByVal value As Boolean)
                mIsExotic = value
            End Set
        End Property

        <DataMember()> _
        Public Property PublicHealthRank() As Integer
            Get
                Return mPublicHealthRank
            End Get
            Set(ByVal value As Integer)
                mPublicHealthRank = value
            End Set
        End Property

        <DataMember()> _
        Public Property PublicHealthProfileVersionId() As Guid
            Get
                Return mPublicHealthProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mPublicHealthProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property WelfareRank() As Integer
            Get
                Return mWelfareRank
            End Get
            Set(ByVal value As Integer)
                mWelfareRank = value
            End Set
        End Property

        <DataMember()> _
        Public Property WelfareProfileVersionId() As Guid
            Get
                Return mWelfareProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mWelfareProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property WiderSocietyRank() As Integer
            Get
                Return mWiderSocietyRank
            End Get
            Set(ByVal value As Integer)
                mWiderSocietyRank = value
            End Set
        End Property

        <DataMember()> _
        Public Property WiderSocietyProfileVersionId() As Guid
            Get
                Return mWiderSocietyProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mWiderSocietyProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property InternationalTradeRank() As Integer
            Get
                Return mInternationalTradeRank
            End Get
            Set(ByVal value As Integer)
                mInternationalTradeRank = value
            End Set
        End Property

        <DataMember()> _
        Public Property InternationalTradeProfileVersionId() As Guid
            Get
                Return mInternationalTradeProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mInternationalTradeProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property RiskRank() As Integer
            Get
                Return mRiskRank
            End Get
            Set(ByVal value As Integer)
                mRiskRank = value
            End Set
        End Property

        <DataMember()> _
        Public Property RiskProfileVersionId() As Guid
            Get
                Return mRiskProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mRiskProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property PotentialToAddValueRank() As Integer
            Get
                Return mPotentialToAddValueRank
            End Get
            Set(ByVal value As Integer)
                mPotentialToAddValueRank = value
            End Set
        End Property

        <DataMember()> _
        Public Property PotentialToAddValueProfileVersionId() As Guid
            Get
                Return mPotentialToAddValueProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mPotentialToAddValueProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsAwaitingValidation() As Boolean
            Get
                Return mIsAwaitingValidation
            End Get
            Set(ByVal value As Boolean)
                mIsAwaitingValidation = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace
