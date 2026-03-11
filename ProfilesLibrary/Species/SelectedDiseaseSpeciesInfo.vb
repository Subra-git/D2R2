Imports Csla
Imports Profiles.Contracts
Public Class SelectedDiseaseSpeciesInfo
    Inherits ReadOnlyBase(Of SelectedDiseaseSpeciesInfo)


#Region " Business Methods "

    Private mId As Guid
    Private mParentId As Guid
    Private mDescription As String = String.Empty
    Private mIsActive As Boolean
    Private mIsInUse As Boolean
    Private mChildList As SelectedDiseaseSpeciesInfoList = SelectedDiseaseSpeciesInfoList.NewList()
    Private mDiseaseName As String = String.Empty
    Private mDisease1 As Integer
    Private mDisease2 As Integer
    Private mDisease3 As Integer
    Private mDisease4 As Integer
    Private mDisease5 As String = String.Empty
    Private mFilterNumber As Int64

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property ParentId() As Guid
        Get
            Return mParentId
        End Get
    End Property

    Public ReadOnly Property Description() As String
        Get
            Return mDescription
        End Get
    End Property

    Public ReadOnly Property IsActive() As Boolean
        Get
            Return mIsActive
        End Get
    End Property

    Public ReadOnly Property IsInUse() As Boolean
        Get
            Return mIsInUse
        End Get
    End Property

    Public ReadOnly Property ChildList() As SelectedDiseaseSpeciesInfoList
        Get
            Return mChildList
        End Get
    End Property

    Public ReadOnly Property DiseaseName() As String
        Get
            Return mDiseaseName
        End Get
    End Property

    Public ReadOnly Property Disease1() As Integer
        Get
            Return mDisease1
        End Get
    End Property

    Public ReadOnly Property Disease2() As Integer
        Get
            Return mDisease2
        End Get
    End Property

    Public ReadOnly Property Disease3() As Integer
        Get
            Return mDisease3
        End Get
    End Property

    Public ReadOnly Property Disease4() As Integer
        Get
            Return mDisease4
        End Get
    End Property

    Public ReadOnly Property Disease5() As String
        Get
            Return mDisease5
        End Get
    End Property

    Public ReadOnly Property FilterNumber() As Long
        Get
            Return mFilterNumber
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides Function ToString() As String
        Return mDescription
    End Function

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetSpeciesInfo(ByVal speciesData As DataContracts.SpeciesData) As SelectedDiseaseSpeciesInfo

        Return New SelectedDiseaseSpeciesInfo(speciesData)
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal speciesData As DataContracts.SpeciesData)
        Fetch(speciesData)
    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
   Friend Shared Function GetDiseaseSpeciesFetch(ByVal user As DataContracts.SpeciesData) As SelectedDiseaseSpeciesInfo
        Return New SelectedDiseaseSpeciesInfo(user)
    End Function

#End Region

#Region " Data Access "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Sub Fetch(ByVal speciesData As DataContracts.SpeciesData)

        mId = speciesData.Id
        mParentId = speciesData.ParentId
        mDescription = speciesData.Description
        mIsActive = speciesData.IsActive
        mIsInUse = speciesData.IsInUse
        mDiseaseName = speciesData.DiseaseName
        mDisease1 = speciesData.Disease1
        mDisease2 = speciesData.Disease2
        mDisease3 = speciesData.Disease3
        mDisease4 = speciesData.Disease4
        mDisease5 = speciesData.Disease5
        mFilterNumber = speciesData.FilterNumber

    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Sub AddChild(ByVal child As SelectedDiseaseSpeciesInfo)

        mChildList.AddSpecies(child)

    End Sub

#End Region

End Class
