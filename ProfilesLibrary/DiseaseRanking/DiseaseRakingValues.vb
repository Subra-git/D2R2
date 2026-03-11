Imports Csla
Imports Profiles.Contracts

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> _
<Serializable()> _
Public Class DiseaseRankingValues
    Inherits BusinessBase(Of DiseaseRankingValues)

#Region " Business Methods "

    Private mFilterId As Guid
    Private mAction As DataContracts.ChangeActionTypeForDisease
    Private mFilterNumber As Int64
    Private mDiseaseType As String = String.Empty
    Private mDiseaseName As String = String.Empty
    Private mDisease1 As String = String.Empty
    Private mDisease2 As String = String.Empty
    Private mDisease3 As String = String.Empty
    Private mDisease4 As String = String.Empty
    Private mDisease5 As String = String.Empty
    Private mSelectedSpecies As Guid
    Private mDateInserted As DateTime
    Private mLastUpdated As DateTime
    Private mIsActive As Byte

    Public ReadOnly Property FilterId() As Guid
        Get
            CanReadProperty(True)
            Return mFilterId
        End Get
    End Property

    Public ReadOnly Property Action() As DataContracts.ChangeActionTypeForDisease
        Get
            CanReadProperty(True)
            Return mAction
        End Get
    End Property

    Public Property FilterNumber() As Long
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mFilterNumber
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Long)
            CanWriteProperty(True)
            If mFilterNumber <> value Then
                mFilterNumber = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property DiseaseType() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mDiseaseType
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mDiseaseType <> value Then
                mDiseaseType = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property DiseaseName() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mDiseaseName
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mDiseaseName <> value Then
                mDiseaseName = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property Disease1() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mDisease1
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mDisease1 <> value Then
                mDisease1 = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property Disease2() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mDisease2
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mDisease2 <> value Then
                mDisease2 = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property Disease3() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mDisease3
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mDisease3 <> value Then
                mDisease3 = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property Disease4() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mDisease4
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mDisease4 <> value Then
                mDisease4 = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property Disease5() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mDisease5
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mDisease5 <> value Then
                mDisease5 = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property SelectedSpecies() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mSelectedSpecies
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Guid)
            CanWriteProperty(True)
            If mSelectedSpecies <> value Then
                mSelectedSpecies = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property DateInserted() As DateTime
        Get
            CanReadProperty(True)
            Return mDateInserted
        End Get
    End Property

    Public Property LastUpdated() As DateTime
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mLastUpdated
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As DateTime)
            CanWriteProperty(True)
            If mLastUpdated <> value Then
                mLastUpdated = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property IsActive() As Byte
        Get
            CanReadProperty(True)
            Return mIsActive
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mFilterId
    End Function

    Public Overrides Sub Delete()
        Throw New InvalidOperationException("You cannot delete a reference data change")
    End Sub

    Public Overrides Function Save() As DiseaseRankingValues

        If Not CanAddDiseaseRakingValuesChange() Then
            Throw New System.Security.SecurityException("You do not have permission to save a reference data change")
        End If

        Return MyBase.Save()

    End Function
#End Region

#Region " Authorization Rules "

    Public Shared Function CanAddDiseaseRakingValuesChange() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

    Public Shared Function CanGetPublicFilterNumber() As Boolean

        Return True
    End Function

    Public Shared Function CanAddDiseaseRakingValuesChangeDelete() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

    Public Function CanEditNewValue() As Boolean

        If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
            Return False
        End If

        Return mAction = DataContracts.ChangeActionTypeForDisease.Edit OrElse mAction = DataContracts.ChangeActionTypeForDisease.Add

    End Function

#End Region

#Region " Factory Methods "
    Public Shared Function DiseaseFilterRankingValues(ByVal DiseaseName As String) As DiseaseRankingValues

        If Not CanGetPublicFilterNumber() Then
            Throw New System.Security.SecurityException("You do not have permission to view a list of current public static reports")
        End If

        Return DataPortal.Fetch(Of DiseaseRankingValues)(New DeleteFilterCrt(DiseaseName))

    End Function

    Public Shared Function DiseaseFilterRankingValuesDelete(ByVal DiseaseName As String) As DiseaseRankingValues

        If Not CanAddDiseaseRakingValuesChangeDelete() Then
            Throw New System.Security.SecurityException("You do not have permission to add new species data.")
        End If

        Return DataPortal.Create(Of DiseaseRankingValues)(New DeleteFilterCrt(DiseaseName))
    End Function

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class GetFilterCrt
        Private mfilterFetchedId As Guid

        Public ReadOnly Property filterFetchedId() As Guid
            Get
                Return mfilterFetchedId
            End Get
        End Property

    End Class

    <Serializable()> _
    Private Class DeleteFilterCrt
        Private mDiseaseName As String

        Public ReadOnly Property DiseaseNameFetched() As String
            Get
                Return mDiseaseName
            End Get
        End Property

        Public Sub New(ByVal DiseaseNameF As String)
            mDiseaseName = DiseaseNameF
        End Sub

    End Class


    Protected Overrides Sub DataPortal_Insert()
        ' insert values

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Dim db As ServiceContracts.IDiseaseRankingService = DataFactory.GetDiseaseRankingService()
        Dim change As New DataContracts.DiseaseRankingValues() With { _
            .FilterNumber = mFilterNumber, _
            .DiseaseName = mDiseaseName, _
            .Disease1 = mDisease1, _
            .Disease2 = mDisease2, _
            .Disease3 = mDisease3, _
            .Disease4 = mDisease4, _
            .Disease5 = mDisease5, _
            .SelectedSpecies = mSelectedSpecies _
        }

        db.InsertDiseaseFilterValue(change)

    End Sub

    Private Overloads Sub DataPortal_Fetch(ByVal dataCri As DeleteFilterCrt)

        Dim db As ServiceContracts.IDiseaseRankingService = DataFactory.GetFilterNumberService()
        Dim filterNumberFetched As DataContracts.DiseaseRankingValues
        filterNumberFetched = db.GetFilterNumberFetchedFromDatabase(New DataContracts.DiseaseRankingValues(), dataCri.DiseaseNameFetched)
        FilterNumber = filterNumberFetched.FilterNumber


    End Sub

    Private Overloads Sub DataPortal_Create(ByVal dataCri As DeleteFilterCrt)

        Dim db As ServiceContracts.IDiseaseRankingService = DataFactory.DeleteFilterNumberFromFilterService()

        Dim change As New DataContracts.DiseaseRankingValues() With { _
            .DiseaseName = dataCri.DiseaseNameFetched _
        }

        db.DeleteFilterNumberFromFilterService(change)

    End Sub

#End Region

End Class
