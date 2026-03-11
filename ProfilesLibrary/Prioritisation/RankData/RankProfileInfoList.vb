Imports Csla
Imports Profiles.Contracts


Public Enum RankCategory    
    Public_Health = 1
    Animal_Welfare = 2
    Wider_Society = 3
    International_Trade = 4
    Risk = 5
    Total = 6
    Total_Including_Risk = 7
    Potential_To_Add_Value = 8
    Public_Health_And_Pmr = 9
    Animal_Welfare_And_Pmr = 10
    Wider_Society_And_Pmr = 11
    International_Trade_And_Pmr = 12
End Enum

<Serializable()> _
Public Class RankProfileInfoList
    Inherits ReadOnlyListBase(Of RankProfileInfoList, RankProfileInfo)

#Region " Business Methods "

    Public Shared Function CalculateRankPosition(ByVal dataList As List(Of RankProfileInfo), _
                                            ByVal category As RankCategory) As List(Of RankProfileInfo)

        Dim currentRank As Double = 0
        Dim currentRiskRank As Integer = 0
        Dim count As Integer = 1
        Dim rankPosition As Integer = 1
        Dim nextRank As Double = 0
        Dim nextRiskRank As Integer = 0
        Dim offset As Integer = 0
        Dim listItemLength As Integer = dataList.Count

        For i As Integer = listItemLength - 1 To 0 Step -1
            Dim item As RankProfileInfo = dataList(i)

            nextRank = item.GetRankByCategory(category)
            nextRiskRank = item.PositiveRiskRank

            If count = 1 Then
                currentRank = nextRank
                item.RankPosition = 1
            Else

                If nextRank < currentRank OrElse (nextRank = currentRank AndAlso nextRiskRank < currentRiskRank) Then
                    item.RankPosition = rankPosition + offset + 1
                    currentRank = nextRank
                    currentRiskRank = nextRiskRank
                    rankPosition = rankPosition + offset + 1
                    offset = 0
                ElseIf nextRank = currentRank Then
                    item.RankPosition = rankPosition
                    currentRank = nextRank
                    currentRiskRank = nextRiskRank
                    offset += 1
                Else
                    'shouldn't happen
                End If

            End If

            count += 1
        Next

        Return dataList

    End Function

    Public Shared Function GetMaxTotalRank(ByVal dataList As List(Of RankProfileInfo)) As Double

        Dim max As Double
        If dataList.Count > 0 Then
            max = dataList(0).TotalRank
        End If

        For Each item As RankProfileInfo In dataList

            If item.TotalRank > max Then
                max = item.TotalRank
            End If

        Next

        Return max

    End Function

    Public Shared Function GetMaxTotalRankIncludingRisk(ByVal dataList As List(Of RankProfileInfo)) As Double

        Dim max As Double
        If dataList.Count > 0 Then
            max = dataList(0).TotalIncludingPositiveRiskRank
        End If

        For Each item As RankProfileInfo In dataList

            If item.TotalIncludingPositiveRiskRank > max Then
                max = item.TotalIncludingPositiveRiskRank
            End If

        Next

        Return max

    End Function

    Public Function GetFilteredSortedList(ByVal isExotic As Boolean?, _
                                          ByVal rankByCategory As RankCategory, _
                                          ByVal takeTop60 As Boolean, _
                                          Optional ByVal isByDisease As Boolean = False) As List(Of RankProfileInfo)

        Dim outputList As New List(Of RankProfileInfo)(Me)

        If isExotic.HasValue Then
            Dim filteredList As New FilteredBindingList(Of RankProfileInfo)(Me, AddressOf Filter)
            Dim filterCrit As FilterCriteria = New FilterCriteria(isExotic.Value)
            filteredList.ApplyFilter(String.Empty, filterCrit)
            outputList = filteredList.ToList()
        End If

        If isByDisease Then
            outputList = FilterOutSpecies(outputList, rankByCategory)
        End If

        Select Case rankByCategory

            Case RankCategory.Animal_Welfare
                outputList = outputList.OrderBy(Function(p) p.AnimalWelfareRank).ThenBy(Function(p) p.PositiveRiskRank).ThenByDescending(Function(p) p.FullTitleWithoutAsterisk).ToList()
            Case RankCategory.International_Trade
                outputList = outputList.OrderBy(Function(p) p.InternationalTradeRank).ThenBy(Function(p) p.PositiveRiskRank).ThenByDescending(Function(p) p.FullTitleWithoutAsterisk).ToList()
            Case RankCategory.Public_Health
                outputList = outputList.OrderBy(Function(p) p.PublicHealthRank).ThenBy(Function(p) p.PositiveRiskRank).ThenByDescending(Function(p) p.FullTitleWithoutAsterisk).ToList()
            Case RankCategory.Wider_Society
                outputList = outputList.OrderBy(Function(p) p.WiderSocietyRank).ThenBy(Function(p) p.PositiveRiskRank).ThenByDescending(Function(p) p.FullTitleWithoutAsterisk).ToList()
            Case RankCategory.Risk
                outputList = outputList.OrderBy(Function(p) p.PositiveRiskRank).ThenByDescending(Function(p) p.FullTitleWithoutAsterisk).ToList()
            Case RankCategory.Potential_To_Add_Value
                outputList = outputList.OrderBy(Function(p) p.PotentialToAddValueRank).ThenBy(Function(p) p.PositiveRiskRank).ThenByDescending(Function(p) p.FullTitleWithoutAsterisk).ToList()
            Case RankCategory.Total
                outputList = outputList.OrderBy(Function(p) p.TotalRank).ThenBy(Function(p) p.PositiveRiskRank).ThenByDescending(Function(p) p.FullTitleWithoutAsterisk).ToList()
            Case RankCategory.Total_Including_Risk
                outputList = outputList.OrderBy(Function(p) p.TotalIncludingPositiveRiskRank).ThenByDescending(Function(p) p.FullTitleWithoutAsterisk).ToList()

        End Select

        If takeTop60 Then
            outputList = outputList.Take(60).ToList()
        End If

        Return outputList

    End Function

    Public Function GetAllSortedList( _
                                          ByVal rankByCategory As RankCategory, _
                                          ByVal takeTop60 As Boolean, _
                                          Optional ByVal isByDisease As Boolean = False) As List(Of RankProfileInfo)
        Dim i As Integer = 0

        Dim riskoutputList As New List(Of RankProfileInfo)(Me)

        riskoutputList = riskoutputList.OrderByDescending(Function(p) p.PositiveRiskRank).ToList()
        Dim riskItemCount As Integer = riskoutputList.Count()
        For Each item As RankProfileInfo In riskoutputList
            If item.PositiveRiskRank > 0 Then
                item.PmrRank = (riskItemCount - i) * 100 / riskItemCount
                i = i + 1
            End If
        Next

        i = 0
        Dim publicHealthoutputList As New List(Of RankProfileInfo)(riskoutputList)

        publicHealthoutputList = publicHealthoutputList.OrderByDescending(Function(p) p.PublicHealthRank).ToList()
        Dim publicHealitemCount As Integer = publicHealthoutputList.Count()
        For Each item As RankProfileInfo In publicHealthoutputList
            If item.PublicHealthRank > 0 Then
                item.PublicHealthPmrRank = (publicHealitemCount - i) * 100 / publicHealitemCount
                i = i + 1
            End If
        Next

        i = 0
        Dim animalWellfareoutputList As New List(Of RankProfileInfo)(publicHealthoutputList)

        animalWellfareoutputList = animalWellfareoutputList.OrderByDescending(Function(p) p.AnimalWelfareRank).ToList()
        Dim animalWellfareitemCount As Integer = animalWellfareoutputList.Count()
        For Each item As RankProfileInfo In animalWellfareoutputList
            If item.AnimalWelfareRank > 0 Then
                item.AnimalWellfarePmrRank = (animalWellfareitemCount - i) * 100 / animalWellfareitemCount
                i = i + 1
            End If
        Next

        i = 0
        Dim wilderSocietyoutputList As New List(Of RankProfileInfo)(animalWellfareoutputList)

        wilderSocietyoutputList = wilderSocietyoutputList.OrderByDescending(Function(p) p.WiderSocietyRank).ToList()
        Dim wilderSocietyitemCount As Integer = wilderSocietyoutputList.Count()
        For Each item As RankProfileInfo In wilderSocietyoutputList
            If item.WiderSocietyRank > 0 Then
                item.WiderSocietyPmrRank = (wilderSocietyitemCount - i) * 100 / wilderSocietyitemCount
                i = i + 1
            End If
        Next

        i = 0
        Dim internationalTradeoutputList As New List(Of RankProfileInfo)(wilderSocietyoutputList)
        internationalTradeoutputList = internationalTradeoutputList.OrderByDescending(Function(p) p.InternationalTradeRank).ToList()
        Dim internationalTradeitemCount As Integer = internationalTradeoutputList.Count()
        For Each item As RankProfileInfo In internationalTradeoutputList
            If item.InternationalTradeRank > 0 Then
                item.InternationalTradePmrRank = (internationalTradeitemCount - i) * 100 / internationalTradeitemCount
                i = i + 1
            End If
        Next

        Dim outputList As New List(Of RankProfileInfo)(internationalTradeoutputList)

        If isByDisease Then
            outputList = FilterOutSpecies(outputList, rankByCategory)
        End If

        Select Case rankByCategory

            Case RankCategory.Animal_Welfare
                outputList.RemoveAll(Function(item) item.AnimalWelfareRank = 0)
                animalWellfareitemCount = outputList.Count()
                i = 0
                outputList = outputList.OrderByDescending(Function(p) p.AnimalWellfarePmrRank).ToList()
                For Each item As RankProfileInfo In outputList
                    If item.AnimalWelfareRank > 0 Then
                        item.AnimalWellfarePmrRank = (animalWellfareitemCount - i) * 100 / animalWellfareitemCount
                        item.AnimalWelfareAndPmrRank = item.AnimalWellfarePmrRank + item.PmrRank
                        i = i + 1
                    End If
                Next

                outputList = outputList.OrderBy(Function(p) p.AnimalWelfareAndPmrRank).ThenByDescending(Function(p) p.FullTitleWithoutAsterisk).ToList()

            Case RankCategory.International_Trade
                outputList.RemoveAll(Function(item) item.InternationalTradeRank = 0)
                internationalTradeitemCount = outputList.Count()
                i = 0
                outputList = outputList.OrderByDescending(Function(p) p.InternationalTradePmrRank).ToList()
                For Each item As RankProfileInfo In outputList
                    If item.InternationalTradeRank > 0 Then
                        item.InternationalTradePmrRank = (internationalTradeitemCount - i) * 100 / internationalTradeitemCount
                        item.InternationalTradeAndPmrRank = item.InternationalTradePmrRank + item.PmrRank
                        i = i + 1
                    End If
                Next

                outputList = outputList.OrderBy(Function(p) p.InternationalTradeAndPmrRank).ThenByDescending(Function(p) p.FullTitleWithoutAsterisk).ToList()

            Case RankCategory.Public_Health
                outputList.RemoveAll(Function(item) item.PublicHealthRank = 0)
                publicHealitemCount = outputList.Count()
                i = 0
                outputList = outputList.OrderByDescending(Function(p) p.PublicHealthPmrRank).ToList()
                For Each item As RankProfileInfo In outputList
                    If item.PublicHealthRank > 0 Then
                        item.PublicHealthPmrRank = (publicHealitemCount - i) * 100 / publicHealitemCount
                        item.PublicHealthAndPmrRank = item.PublicHealthPmrRank + item.PmrRank
                        i = i + 1
                    End If
                Next

                outputList = outputList.OrderBy(Function(p) p.PublicHealthAndPmrRank).ThenByDescending(Function(p) p.FullTitleWithoutAsterisk).ToList()

            Case RankCategory.Wider_Society
                outputList.RemoveAll(Function(item) item.WiderSocietyRank = 0)
                wilderSocietyitemCount = outputList.Count()
                i = 0
                outputList = outputList.OrderByDescending(Function(p) p.WiderSocietyPmrRank).ToList()
                For Each item As RankProfileInfo In outputList
                    If item.WiderSocietyRank > 0 Then
                        item.WiderSocietyPmrRank = (wilderSocietyitemCount - i) * 100 / wilderSocietyitemCount
                        item.WiderSocietyAndPmrRank = item.WiderSocietyPmrRank + item.PmrRank
                        i = i + 1
                    End If
                Next

                outputList = outputList.OrderBy(Function(p) p.WiderSocietyAndPmrRank).ThenByDescending(Function(p) p.FullTitleWithoutAsterisk).ToList()
                
            Case RankCategory.Risk
                outputList.RemoveAll(Function(item) item.PositiveRiskRank = 0)
                wilderSocietyitemCount = outputList.Count()
                i = 0
                outputList = outputList.OrderByDescending(Function(p) p.PmrRank).ToList()
                For Each item As RankProfileInfo In outputList
                    If item.PositiveRiskRank > 0 Then
                        item.PmrRank = (wilderSocietyitemCount - i) * 100 / wilderSocietyitemCount
                        i = i + 1
                    End If
                Next

                outputList = outputList.OrderBy(Function(p) p.PmrRank).ThenByDescending(Function(p) p.FullTitleWithoutAsterisk).ToList()

            Case RankCategory.Potential_To_Add_Value
                outputList = outputList.OrderBy(Function(p) p.PotentialToAddValueRank).ThenBy(Function(p) p.PositiveRiskRank).ThenByDescending(Function(p) p.FullTitleWithoutAsterisk).ToList()
            Case RankCategory.Total
                outputList = outputList.OrderBy(Function(p) p.TotalRank).ThenBy(Function(p) p.PositiveRiskRank).ThenByDescending(Function(p) p.FullTitleWithoutAsterisk).ToList()
            Case RankCategory.Total_Including_Risk
                outputList = outputList.OrderBy(Function(p) p.TotalIncludingPositiveRiskRank).ThenByDescending(Function(p) p.FullTitleWithoutAsterisk).ToList()

        End Select

        If takeTop60 Then
            outputList = outputList.Take(60).ToList()
        End If

        Return outputList

    End Function

    Private Function FilterOutSpecies(ByVal dataList As List(Of RankProfileInfo), ByVal category As RankCategory) As List(Of RankProfileInfo)

        Dim dictionary As New Dictionary(Of Guid, RankProfileInfo)

        Dim nextSpeciesId As Guid
        Dim nextProfileId As Guid

        For Each item As RankProfileInfo In dataList
            nextProfileId = item.ProfileId
            nextSpeciesId = item.SpeciesId

            If Not dictionary.ContainsKey(item.ProfileId) Then
                dictionary.Add(item.ProfileId, item)
            Else
                Dim currentItem As RankProfileInfo = dictionary(item.ProfileId)
                If currentItem.GetRankByCategory(category) < item.GetRankByCategory(category) Then
                    dictionary(item.ProfileId) = item
                End If
            End If

        Next

        Return dictionary.Values.ToList()
    End Function

    Public Shared Function Filter(ByVal item As Object, ByVal filterValue As Object) As Boolean
        Dim result As Boolean = False

        If Not item Is Nothing AndAlso Not filterValue Is Nothing Then

            Dim rankInfo As RankProfileInfo = DirectCast(item, RankProfileInfo)
            Dim crit As FilterCriteria = DirectCast(filterValue, FilterCriteria)

            result = (rankInfo.IsExotic = crit.IsExotic)

        End If
        Return result

    End Function

    Public Shared Function FilterDiseasesWithNoRfiImpact(ByRef diseases As List(Of RankProfileInfo), ByVal rfi As RankCategory) As List(Of RankProfileInfo)
        Dim outputList As New List(Of RankProfileInfo)()
        For Each disease As RankProfileInfo In diseases
            Select Case rfi
                Case RankCategory.Animal_Welfare
                    If disease.AnimalWelfareRank > 0 Then
                        outputList.Add(disease)
                    End If
                Case RankCategory.International_Trade
                    If disease.InternationalTradeRank > 0 Then
                        outputList.Add(disease)
                    End If
                Case RankCategory.Public_Health
                    If disease.PublicHealthRank > 0 Then
                        outputList.Add(disease)
                    End If
                Case RankCategory.Wider_Society
                    If disease.WiderSocietyRank > 0 Then
                        outputList.Add(disease)
                    End If
                Case RankCategory.Risk
                    If disease.PositiveRiskRank > 0 Then
                        outputList.Add(disease)
                    End If
                Case RankCategory.Potential_To_Add_Value
                    If disease.PotentialToAddValueRank > 0 Then
                        outputList.Add(disease)
                    End If
                Case Else
                    Throw New Exception("Invalid RFI.")
            End Select
        Next
        Return outputList
    End Function

    Private Class FilterCriteria

        Private mIsExotic As Boolean

        Public ReadOnly Property IsExotic() As Boolean
            Get
                Return mIsExotic
            End Get
        End Property

        Public Sub New(ByVal isExotic As Boolean)
            mIsExotic = isExotic
        End Sub

    End Class

#End Region

#Region " Authorization Rules "

    Public Shared Function CanGetRankProfileInfoList() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor

    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetRankProfileInfoList() As RankProfileInfoList

        If Not CanGetRankProfileInfoList() Then
            Throw New System.Security.SecurityException("You do not have permission to get the Rank Profile Info List.")
        End If
        Return DataPortal.Fetch(Of RankProfileInfoList)(New Criteria(""))
    End Function

    Public Shared Function GetRankProfileInfoListWithFilter(ByVal value As String) As RankProfileInfoList

        If Not CanGetRankProfileInfoList() Then
            Throw New System.Security.SecurityException("You do not have permission to get the Rank Profile Info List.")
        End If
        Return DataPortal.Fetch(Of RankProfileInfoList)(New Criteria(value))
    End Function

    Public Shared Function GetFishRankProfileInfoList() As RankProfileInfoList
        If Not CanGetRankProfileInfoList() Then
            Throw New System.Security.SecurityException("You do not have permission to get the Rank Profile Info List.")
        End If
        Return DataPortal.Fetch(Of RankProfileInfoList)(New Criteria(Criteria.FilterType.FishDiseases))
    End Function

    Public Shared Function GetTerrestrialProfileInfoList() As RankProfileInfoList
        If Not CanGetRankProfileInfoList() Then
            Throw New System.Security.SecurityException("You do not have permission to get the Rank Profile Info List.")
        End If
        Return DataPortal.Fetch(Of RankProfileInfoList)(New Criteria(Criteria.FilterType.TerrestrialDiseases))
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria

        Public Enum FilterType As Integer
            All
            FishDiseases
            TerrestrialDiseases
        End Enum

        Public mReportFilterType As String

        Private mFilter As FilterType
        Private mSpeciesList As List(Of DataContracts.SpeciesData)

        Private ReadOnly Property SpeciesList() As List(Of DataContracts.SpeciesData)
            Get
                If mSpeciesList Is Nothing Then
                    Dim db As ServiceContracts.ISpeciesDataService = DataFactory.GetSpeciesDataService()
                    mSpeciesList = db.GetAllSpecies()
                    Return mSpeciesList
                Else
                    Return mSpeciesList
                End If
            End Get
        End Property

        Public Property Filter() As FilterType
            Get
                Return mFilter
            End Get
            Set(ByVal value As FilterType)
                mFilter = value
            End Set
        End Property

        Public Property NameOfFilter() As String
            Get
                Return mReportFilterType
            End Get
            Set(ByVal value As String)
                mReportFilterType = value
            End Set
        End Property

        Public Sub New(ByVal value As String)
            Filter = FilterType.All
            mReportFilterType = value
        End Sub

        Public Sub New(ByVal filter As FilterType)
            Me.Filter = filter
        End Sub

        Private Function IsFishDisease(ByRef profile As DataContracts.RankProfileData) As Boolean
            Dim currentSearchSpecies As DataContracts.SpeciesData
            currentSearchSpecies = FindSpeciesByName(SpeciesList, profile.SpeciesName)
            While currentSearchSpecies.ParentId <> Nothing
                currentSearchSpecies = FindSpeciesById(SpeciesList, currentSearchSpecies.ParentId)
            End While
            If currentSearchSpecies.Description = "Fish" Or currentSearchSpecies.Description = "Molluscs" Then
                Return True
            Else
                Return False
            End If
        End Function

        Private Function IsTerrestrialDisease(ByRef profile As DataContracts.RankProfileData) As Boolean
            Dim currentSearchSpecies As DataContracts.SpeciesData
            currentSearchSpecies = FindSpeciesById(SpeciesList, profile.SpeciesId)
            While currentSearchSpecies.ParentId <> Nothing
                currentSearchSpecies = FindSpeciesById(SpeciesList, currentSearchSpecies.ParentId)
            End While
            If currentSearchSpecies.Description <> "Fish" And currentSearchSpecies.Description <> "Molluscs" Then
                Return True
            Else
                Return False
            End If
        End Function

        Public Function Match(ByRef profile As DataContracts.RankProfileData) As Boolean
            Select Case Filter
                Case FilterType.All
                    Return True
                Case FilterType.FishDiseases
                    Return IsFishDisease(profile)
                Case FilterType.TerrestrialDiseases
                    Return IsTerrestrialDisease(profile)
            End Select
        End Function

        Private Function FindSpeciesById(ByRef speciesData As List(Of DataContracts.SpeciesData), ByVal id As Guid) As DataContracts.SpeciesData
            For Each species As DataContracts.SpeciesData In speciesData
                If species.Id = id Then
                    Return species
                End If
            Next
            Return Nothing
        End Function

        Private Function FindSpeciesByName(ByRef speciesData As List(Of DataContracts.SpeciesData), ByVal name As String) As DataContracts.SpeciesData
            For Each species As DataContracts.SpeciesData In speciesData
                If species.Description = name Then
                    Return species
                End If
            Next
            Return Nothing
        End Function

    End Class

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA1801:ReviewUnusedParameters", MessageId:="criteria")> <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        Dim db As ServiceContracts.IPrioritisationService = DataFactory.GetPrioritisationService()
        Dim dtoRankProfileDataList As List(Of DataContracts.RankProfileData) = db.GetRankProfileDataForFilter(criteria.mReportFilterType)

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each dtoRankProfileData As DataContracts.RankProfileData In dtoRankProfileDataList
            If criteria.Match(dtoRankProfileData) Then
                Me.Add(RankProfileInfo.GetRankProfileInfo(dtoRankProfileData))
            End If
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
