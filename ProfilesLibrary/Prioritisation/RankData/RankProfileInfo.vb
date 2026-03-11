Imports Csla
Imports Profiles.Contracts
Imports System.Text
Imports System.Globalization

<Serializable()> _
Public Class RankProfileInfo
    Inherits ReadOnlyBase(Of RankProfileInfo)

    Private mSequenceNumber As Integer
    Private mProfileId As Guid
    Private mProfileVersionId As Guid
    Private mSpeciesId As Guid
    Private mProfileTitle As String
    Private mSpeciesName As String
    Private mPublicHealthRank As Integer
    Private mPublicHealthAndPmrRank As Double
    Private mPublicHealthProfileVersionId As Guid
    Private mAnimalWelfareRank As Integer
    Private mAnimalWelfareAndPmrRank As Double
    Private mAnimalWelfareProfileVersionId As Guid
    Private mWiderSocietyRank As Integer
    Private mWiderSocietyAndPmrRank As Double
    Private mWiderSocietyProfileVersionId As Guid
    Private mInternationalTradeRank As Integer
    Private mInternationalTradeAndPmrRank As Double
    Private mInternationalTradeProfileVersionId As Guid
    Private mRiskRank As Integer
    Private mPmrRank As Double
    Private mPublicHealthPmrRank As Double
    Private mAnimalWellfarePmrRank As Double
    Private mWiderSocietyPmrRank As Double
    Private mInternationalTradePmrRank As Double
    Private mRiskProfileVersionId As Guid
    Private mPotentialToAddValueRank As Integer
    Private mPotentialToAddValueProfileVersionId As Guid
    Private mIsExotic As Boolean
    Private mRankPosition As Integer
    Private mIsAwaitingValidation As Boolean
    Private mBarLength As Double

#Region " Business Methods"

    Public ReadOnly Property SequenceNumber() As Integer
        Get
            Return mSequenceNumber
        End Get
    End Property

    Public ReadOnly Property ProfileId() As Guid
        Get
            Return mProfileId
        End Get
    End Property

    Public ReadOnly Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
    End Property

    Public ReadOnly Property SpeciesId() As Guid
        Get
            Return mSpeciesId
        End Get
    End Property

    Public ReadOnly Property ProfileTitle() As String
        Get
            Return mProfileTitle
        End Get
    End Property

    Public ReadOnly Property SpeciesName() As String
        Get
            Return mSpeciesName
        End Get
    End Property

    Public ReadOnly Property FullTitle(ByVal length As Integer) As String
        Get
            'GS: this is where the chart's text is built
            Dim title As New StringBuilder
            If mIsAwaitingValidation Then
                title.Append("*")
            End If
            If mIsExotic Then
                ' exotics are in capitals
                title.Append(mProfileTitle.ToUpper() & " (" & mSpeciesName.ToUpper() & ")")
            Else
                ' endemic titles are not altered
                title.Append(mProfileTitle & " (" & mSpeciesName & ")")
            End If

            If title.Length > length Then
                Return title.ToString.Substring(0, length)
            Else
                Return title.ToString()
            End If
        End Get
    End Property

    Public ReadOnly Property FullTitle() As String
        Get
            Return FullTitle(50)
        End Get
    End Property

    Public ReadOnly Property FullTitleWithoutAsterisk() As String
        Get
            Dim title As New StringBuilder
            If mIsExotic Then
                ' exotics are in capitals
                title.Append(mProfileTitle.ToUpper() & " (" & mSpeciesName.ToUpper() & ")")
            Else
                ' endemic titles are not altered
                title.Append(mProfileTitle & " (" & mSpeciesName & ")")
            End If

            If title.Length > 50 Then
                Return title.ToString.Substring(0, 50)
            Else
                Return title.ToString()
            End If
        End Get
    End Property

    Public ReadOnly Property FullTitleMixedCase(ByVal length As Integer) As String
        'Returns the same as FullTitle, except that for exotic diseases
        'only the disease name is returned in upper case. The species
        'name remains lower case.
        Get
            If mIsExotic Then
                Dim title As New StringBuilder()
                If mIsAwaitingValidation Then
                    title.Append("*")
                End If
                title.Append(mProfileTitle.ToUpper() & " (" & mSpeciesName & ")")
                If title.Length > length Then
                    Return title.ToString().Substring(0, length)
                Else
                    Return title.ToString()
                End If
            Else
                Return FullTitle(length)
            End If
        End Get
    End Property

    Public ReadOnly Property FullTitleMixedCase() As String
        Get
            Return FullTitleMixedCase(50)
        End Get
    End Property

    Public ReadOnly Property PublicHealthRank() As Integer
        Get
            Return mPublicHealthRank
        End Get
    End Property

    Public Property PublicHealthAndPmrRank() As Double
        Get
            Return mPublicHealthAndPmrRank
        End Get
        Set(ByVal value As Double)
            mPublicHealthAndPmrRank = value
        End Set
    End Property

    Public ReadOnly Property PublicHealthProfileVersionId() As Guid
        Get
            Return mPublicHealthProfileVersionId
        End Get
    End Property

    Public ReadOnly Property AnimalWelfareRank() As Integer
        Get
            Return mAnimalWelfareRank
        End Get
    End Property

    Public Property AnimalWelfareAndPmrRank() As Double
        Get
            Return mAnimalWelfareAndPmrRank
        End Get
        Set(ByVal value As Double)
            mAnimalWelfareAndPmrRank = value
        End Set
    End Property

    Public ReadOnly Property AnimalWelfareProfileVersionId() As Guid
        Get
            Return mAnimalWelfareProfileVersionId
        End Get
    End Property

    Public ReadOnly Property WiderSocietyRank() As Integer
        Get
            Return mWiderSocietyRank
        End Get
    End Property

    Public Property WiderSocietyAndPmrRank() As Double
        Get
            Return mWiderSocietyAndPmrRank
        End Get
        Set(ByVal value As Double)
            mWiderSocietyAndPmrRank = value
        End Set
    End Property

    Public ReadOnly Property WiderSocietyProfileVersionId() As Guid
        Get
            Return mWiderSocietyProfileVersionId
        End Get
    End Property

    Public ReadOnly Property InternationalTradeRank() As Integer
        Get
            Return mInternationalTradeRank
        End Get
    End Property

    Public Property InternationalTradeAndPmrRank() As Double
        Get
            Return mInternationalTradeAndPmrRank
        End Get
        Set(ByVal value As Double)
            mInternationalTradeAndPmrRank = value
        End Set
    End Property

    Public ReadOnly Property InternationalTradeProfileVersionId() As Guid
        Get
            Return mInternationalTradeProfileVersionId
        End Get
    End Property

    Public ReadOnly Property PotentialToAddValueRank() As Integer
        Get
            Return mPotentialToAddValueRank
        End Get
    End Property

    Public ReadOnly Property PotentialToAddValueProfileVersionId() As Guid
        Get
            Return mPotentialToAddValueProfileVersionId
        End Get
    End Property

    Public ReadOnly Property RiskProfileVersionId() As Guid
        Get
            Return mRiskProfileVersionId
        End Get
    End Property

    Public ReadOnly Property IsAwaitingValidation() As Boolean
        Get
            Return mIsAwaitingValidation
        End Get
    End Property

    Public Function GetRankByCategory(ByVal category As RankCategory) As Double

        Select Case category

            Case RankCategory.Public_Health
                Return mPublicHealthRank
            Case RankCategory.Public_Health_And_Pmr
                Return mPublicHealthAndPmrRank
            Case RankCategory.International_Trade
                Return mInternationalTradeRank
            Case RankCategory.International_Trade_And_Pmr
                Return mInternationalTradeAndPmrRank
            Case RankCategory.Risk
                Return mRiskRank
            Case RankCategory.Animal_Welfare
                Return mAnimalWelfareRank
            Case RankCategory.Animal_Welfare_And_Pmr
                Return mAnimalWelfareAndPmrRank
            Case RankCategory.Wider_Society
                Return mWiderSocietyRank
            Case RankCategory.Wider_Society_And_Pmr
                Return mWiderSocietyAndPmrRank
            Case RankCategory.Risk
                Return PositiveRiskRank
            Case RankCategory.Potential_To_Add_Value
                Return mPotentialToAddValueRank
            Case RankCategory.Total
                Return TotalRank
            Case RankCategory.Total_Including_Risk
                Return TotalIncludingPositiveRiskRank
            Case Else
                Return 0
        End Select

    End Function

    Public ReadOnly Property RiskRank() As Integer
        Get
            Return mRiskRank * (-1)
        End Get
    End Property

    Public ReadOnly Property PositiveRiskRank() As Integer
        Get
            Return mRiskRank
        End Get
    End Property

    Public Property PublicHealthPmrRank() As Double
        Get
            Return mPublicHealthPmrRank
        End Get
        Set(ByVal value As Double)
            mPublicHealthPmrRank = value
        End Set
    End Property

    Public Property AnimalWellfarePmrRank() As Double
        Get
            Return mAnimalWellfarePmrRank
        End Get
        Set(ByVal value As Double)
            mAnimalWellfarePmrRank = value
        End Set
    End Property

    Public Property WiderSocietyPmrRank() As Double
        Get
            Return mWiderSocietyPmrRank
        End Get
        Set(ByVal value As Double)
            mWiderSocietyPmrRank = value
        End Set
    End Property

    Public Property InternationalTradePmrRank() As Double
        Get
            Return mInternationalTradePmrRank
        End Get
        Set(ByVal value As Double)
            mInternationalTradePmrRank = value
        End Set
    End Property

    Public Property PmrRank() As Double
        Get
            Return mPmrRank
        End Get
        Set(ByVal value As Double)
            mPmrRank = value
        End Set
    End Property

    Public Property RankPosition() As Integer
        Get
            Return mRankPosition
        End Get
        Set(ByVal value As Integer)
            mRankPosition = value
        End Set
    End Property

    Public ReadOnly Property TotalRank() As Integer
        Get
            'the total does not include the risk rank
            Return mPublicHealthRank + mAnimalWelfareRank + mWiderSocietyRank + mInternationalTradeRank
        End Get
    End Property

    Public ReadOnly Property TotalIncludingPositiveRiskRank() As Integer
        Get
            Return mPublicHealthRank + mAnimalWelfareRank + mWiderSocietyRank + mInternationalTradeRank + mRiskRank
        End Get
    End Property

    Public ReadOnly Property TotalIncludingNegativeRiskRank() As Integer
        Get
            Return mPublicHealthRank + mAnimalWelfareRank + mWiderSocietyRank + mInternationalTradeRank + Me.RiskRank
        End Get
    End Property

    Public ReadOnly Property IsExotic() As Boolean
        Get
            Return mIsExotic
        End Get
    End Property

    Public Property BarLength() As Double
        Get
            Return mBarLength
        End Get
        Set(ByVal value As Double)
            mBarLength = value
        End Set
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mProfileId.ToString() & "_" & mSpeciesId.ToString()
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetRankProfileInfo(ByVal dtoRankProfileData As DataContracts.RankProfileData) As RankProfileInfo

        Return New RankProfileInfo(dtoRankProfileData)

    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoRankProfileData As DataContracts.RankProfileData)

        Fetch(dtoRankProfileData)

    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoRankProfileData As DataContracts.RankProfileData)

        mProfileId = dtoRankProfileData.ProfileId
        mProfileVersionId = dtoRankProfileData.ProfileVersionId
        mSpeciesId = dtoRankProfileData.SpeciesId
        mProfileTitle = dtoRankProfileData.ProfileTitle.StripHtmlTags
        mSpeciesName = dtoRankProfileData.SpeciesName.StripHtmlTags
        mPublicHealthRank = dtoRankProfileData.PublicHealthRank
        mPublicHealthProfileVersionId = dtoRankProfileData.PublicHealthProfileVersionId
        mAnimalWelfareRank = dtoRankProfileData.WelfareRank
        mAnimalWelfareProfileVersionId = dtoRankProfileData.WelfareProfileVersionId
        mWiderSocietyRank = dtoRankProfileData.WiderSocietyRank
        mWiderSocietyProfileVersionId = dtoRankProfileData.WiderSocietyProfileVersionId
        mInternationalTradeRank = dtoRankProfileData.InternationalTradeRank
        mInternationalTradeProfileVersionId = dtoRankProfileData.InternationalTradeProfileVersionId
        mPotentialToAddValueRank = dtoRankProfileData.PotentialToAddValueRank
        mPotentialToAddValueProfileVersionId = dtoRankProfileData.PotentialToAddValueProfileVersionId
        mRiskRank = dtoRankProfileData.RiskRank
        mRiskProfileVersionId = dtoRankProfileData.RiskProfileVersionId
        mIsExotic = dtoRankProfileData.IsExotic
        mIsAwaitingValidation = dtoRankProfileData.IsAwaitingValidation
        mPublicHealthAndPmrRank = mPublicHealthRank + PositiveRiskRank
        mAnimalWelfareAndPmrRank = mAnimalWelfareRank + PositiveRiskRank
        mWiderSocietyAndPmrRank = mWiderSocietyRank + PositiveRiskRank
        mInternationalTradeAndPmrRank = mInternationalTradeRank + PositiveRiskRank
    End Sub

#End Region

End Class
