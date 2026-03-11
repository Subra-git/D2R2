Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileAnswerDataSingleSection

        Private mProfiledSpeciesList As List(Of ProfiledSpecies)
        Private mProfileVersionSection As ProfileVersionSection

        <DataMember()> _
        Public Property ProfileVersionSection() As ProfileVersionSection
            Get
                Return mProfileVersionSection
            End Get
            Set(ByVal value As ProfileVersionSection)
                mProfileVersionSection = value
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
