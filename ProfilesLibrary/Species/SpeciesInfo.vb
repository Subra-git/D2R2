Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SpeciesInfo
    Inherits ReadOnlyBase(Of SpeciesInfo)

#Region " Business Methods "

    Private mId As Guid
    Private mParentId As Guid
    Private mDescription As String = String.Empty
    Private mIsActive As Boolean
    Private mIsInUse As Boolean
    Private mChildList As SpeciesInfoList = SpeciesInfoList.NewList()

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

    Public ReadOnly Property ChildList() As SpeciesInfoList
        Get
            Return mChildList
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
    Friend Shared Function GetSpeciesInfo(ByVal speciesData As DataContracts.SpeciesData) As SpeciesInfo

        Return New SpeciesInfo(speciesData)
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal speciesData As DataContracts.SpeciesData)
        Fetch(speciesData)
    End Sub

#End Region

#Region " Data Access "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Sub Fetch(ByVal speciesData As DataContracts.SpeciesData)

        mId = speciesData.Id
        mParentId = speciesData.ParentId
        mDescription = speciesData.Description
        mIsActive = speciesData.IsActive
        mIsInUse = speciesData.IsInUse

    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Sub AddChild(ByVal child As SpeciesInfo)

        mChildList.AddSpecies(child)

    End Sub

#End Region

End Class
