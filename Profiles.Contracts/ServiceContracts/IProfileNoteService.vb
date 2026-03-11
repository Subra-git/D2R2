Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Namespace ServiceContracts

    <ServiceContract()> _
    Public Interface IProfileNoteService

        <OperationContract()> _
        Function GetNoteTypes() As List(Of DataContracts.ProfileNoteType)

        <OperationContract()> _
        Function GetNotesBySection(ByVal request As DataContracts.GetProfileNotesBySectionRequest) As List(Of DataContracts.ProfileNote)

        <OperationContract()> _
        Function GetNotesByVersion(ByVal request As DataContracts.GetProfileNotesByVersionRequest) As List(Of DataContracts.ProfileNote)

        <OperationContract()> _
        Function UpdateNotes(ByVal request As DataContracts.ProfileNoteChangeset) As ChangeResult

    End Interface

End Namespace
