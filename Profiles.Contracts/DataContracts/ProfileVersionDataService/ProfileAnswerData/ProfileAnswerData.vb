Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileAnswerData

        Private mProfiledSpeciesList As List(Of ProfiledSpecies)
        Private mProfileVersionSectionList As List(Of ProfileVersionSection)

        <DataMember()> _
        Public Property ProfileVersionSectionList() As List(Of ProfileVersionSection)
            Get
                Return mProfileVersionSectionList
            End Get
            Set(ByVal value As List(Of ProfileVersionSection))
                mProfileVersionSectionList = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfiledSpeciesList() As List(Of ProfiledSpecies)
            Get
                Return mProfiledSpeciesList
            End Get
            Set(ByVal value As List(Of ProfiledSpecies))
                mProfiledSpeciesList = value
            End Set
        End Property

    End Class
End Namespace
