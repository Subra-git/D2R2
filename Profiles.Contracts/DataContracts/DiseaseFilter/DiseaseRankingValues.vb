Imports System.Runtime.Serialization

Namespace DataContracts

    Public Enum ChangeActionTypeForDisease
        Add
        Edit
        Inactivate
        Delete
    End Enum

    <DataContract()> _
Public Class DiseaseRankingValues

        Private mFilterId As Guid
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
        Private mAction As ChangeActionTypeForDisease

        <DataMember()> _
        Public Property FilterId() As Guid
            Get
                Return mFilterId
            End Get
            Set(ByVal value As Guid)
                mFilterId = value
            End Set
        End Property

        <DataMember()> _
        Public Property FilterNumber() As Long
            Get
                Return mFilterNumber
            End Get
            Set(ByVal value As Long)
                mFilterNumber = value
            End Set
        End Property

        <DataMember()> _
        Public Property DiseaseType() As String
            Get
                Return mDiseaseType
            End Get
            Set(ByVal value As String)
                mDiseaseType = value
            End Set
        End Property

        <DataMember()> _
        Public Property DiseaseName() As String
            Get
                Return mDiseaseName
            End Get
            Set(ByVal value As String)
                mDiseaseName = value
            End Set
        End Property

        <DataMember()> _
        Public Property Disease1() As String
            Get
                Return mDisease1
            End Get
            Set(ByVal value As String)
                mDisease1 = value
            End Set
        End Property

        <DataMember()> _
        Public Property Disease2() As String
            Get
                Return mDisease2
            End Get
            Set(ByVal value As String)
                mDisease2 = value
            End Set
        End Property

        <DataMember()> _
        Public Property Disease3() As String
            Get
                Return mDisease3
            End Get
            Set(ByVal value As String)
                mDisease3 = value
            End Set
        End Property

        <DataMember()> _
        Public Property Disease4() As String
            Get
                Return mDisease4
            End Get
            Set(ByVal value As String)
                mDisease4 = value
            End Set
        End Property

        <DataMember()> _
        Public Property Disease5() As String
            Get
                Return mDisease5
            End Get
            Set(ByVal value As String)
                mDisease5 = value
            End Set
        End Property

        <DataMember()> _
        Public Property SelectedSpecies() As Guid
            Get
                Return mSelectedSpecies
            End Get
            Set(ByVal value As Guid)
                mSelectedSpecies = value
            End Set
        End Property

        <DataMember()> _
        Public Property DateInserted() As DateTime
            Get
                Return mDateInserted
            End Get
            Set(ByVal value As DateTime)
                mDateInserted = value
            End Set
        End Property

        <DataMember()> _
        Public Property LastUpdated() As DateTime
            Get
                Return mLastUpdated
            End Get
            Set(ByVal value As DateTime)
                mLastUpdated = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsActive() As Byte
            Get
                Return mIsActive
            End Get
            Set(ByVal value As Byte)
                mIsActive = value
            End Set
        End Property

        <DataMember()> _
        Public Property Action() As ChangeActionTypeForDisease
            Get
                Return mAction
            End Get
            Set(ByVal value As ChangeActionTypeForDisease)
                mAction = value
            End Set
        End Property

    End Class

End Namespace