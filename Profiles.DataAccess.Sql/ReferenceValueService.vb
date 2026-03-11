Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports Profiles.Reports
Imports System.Data.SqlClient
Imports Profiles.DataAccess.Sql.Data

Public Class ReferenceValueService
    Implements IReferenceValueService

    Public Function GetLookupValues(ByVal request As GetLookupValuesRequest) As List(Of LookupValue) Implements IReferenceValueService.GetLookupValues

        Dim returnList As New List(Of LookupValue)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgLookupValueByTable"
                getCommand.Parameters.AddWithValue("@ReferenceTableId", request.ReferenceTableId)
                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        returnList.Add(New LookupValue() With {.Id = reader.GetGuid(0), .LookupValue = reader.GetString(1)})
                    End While
                End Using
            End Using
        End Using

        Return returnList

    End Function

    Public Function GetReferenceValues(ByVal request As GetReferenceValuesRequest) As List(Of ReferenceValue) Implements IReferenceValueService.GetReferenceValues

        Dim returnList As New List(Of ReferenceValue)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgReferenceValueByTable"
                getCommand.Parameters.AddWithValue("@ReferenceTableId", request.ReferenceTableId)

                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read
                        returnList.Add(New ReferenceValue() With { _
                                        .Id = reader.GetGuid(0), _
                                        .Value = reader.GetString(1), _
                                        .EffectiveDateFrom = reader.GetDateTime(2), _
                                        .EffectiveDateTo = reader.GetDateTime(3), _
                                        .IsInUse = reader.GetBoolean(4), _
                                        .IsActive = reader.GetBoolean(5)})
                    End While
                End Using
            End Using
        End Using

        Return returnList

    End Function

    Public Function GetReferenceTableAuditTrail(ByVal request As GetReferenceTableAuditTrailRequest) As List(Of ReferenceTableAuditTrailEntry) Implements IReferenceValueService.GetReferenceTableAuditTrail

        Dim returnList As New List(Of ReferenceTableAuditTrailEntry)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()
            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgReferenceTableAudit"
                getCommand.Parameters.AddWithValue("ReferenceTableId", request.ReferenceTableId)

                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read
                        returnList.Add(New ReferenceTableAuditTrailEntry() With { _
                                       .Id = reader.GetGuid(0), _
                                       .OldValue = reader.GetString(1), _
                                        .NewValue = reader.GetString(2), _
                                        .User = reader.GetString(3), _
                                        .EffectiveDate = reader.GetDateTime(4), _
                                        .DateOfChange = reader.GetDateTime(5), _
                                        .ReasonForChange = reader.GetString(6) _
                        })

                    End While
                End Using
            End Using
        End Using

        Return returnList

    End Function

    Public Function GetReferenceTable(ByVal request As GetReferenceTableRequest) As ReferenceTable Implements IReferenceValueService.GetReferenceTable

        Dim name As ReferenceTable = Nothing

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgReferenceTableName"
                getCommand.Parameters.AddWithValue("@ReferenceTableId", request.ReferenceTableId)
                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        name = New ReferenceTable(request.ReferenceTableId, reader.GetString(0))
                    End While
                End Using
            End Using
        End Using

        Return name

    End Function

    Public Function GetMaintainableReferenceTables() As List(Of ReferenceTable) Implements IReferenceValueService.GetMaintainableReferenceTables

        Dim result As New List(Of ReferenceTable)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgMaintainableReferenceTables"

                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read
                        result.Add(New ReferenceTable(reader.GetGuid(0), reader.GetString(1)))
                    End While
                End Using
            End Using
        End Using

        Return result

    End Function

    Public Function GetReferenceValueDetail(ByVal request As GetReferenceValueDetailRequest) As ReferenceValueDetail Implements IReferenceValueService.GetReferenceValueDetail

        Dim result As ReferenceValueDetail = Nothing

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgReferenceValue"
                getCommand.Parameters.AddWithValue("@ValueId", request.ReferenceValueId)

                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        result = New ReferenceValueDetail
                        With result
                            .Value = reader.GetString(0)
                            .IsInUse = reader.GetBoolean(1)
                            .EffectiveDateFrom = reader.GetDateTime(2)
                            .EffectiveDateTo = reader.GetDateTime(3)
                            reader.GetBytes("LastUpdated", 0, .LastUpdated, 0, 8)
                        End With
                    End While
                End Using
            End Using
        End Using

        Return result

    End Function

    Public Sub UpdateReferenceValue(ByVal request As ReferenceValueChange) Implements IReferenceValueService.UpdateReferenceValue

        Select Case request.Action
            Case ChangeActionType.Add
                InsertReferenceValue(request)
            Case ChangeActionType.Delete
                DeleteReferenceValue(request)
            Case ChangeActionType.Edit
                EditReferenceValue(request)
            Case ChangeActionType.Inactivate
                InactivateReferenceValue(request)
        End Select

    End Sub

    Private Sub InsertReferenceValue(ByVal request As ReferenceValueChange)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using insertReferenceValueCommand As SqlCommand = connection.CreateCommand
                insertReferenceValueCommand.CommandType = CommandType.StoredProcedure
                insertReferenceValueCommand.CommandText = "spiReferenceValue"
                insertReferenceValueCommand.Parameters.AddWithValue("@ReferenceTableId", request.ReferenceTableId)
                insertReferenceValueCommand.Parameters.AddWithValue("@ValueId", request.Id)
                insertReferenceValueCommand.Parameters.AddWithValue("@NewLookupValue", request.NewValue)
                insertReferenceValueCommand.Parameters.AddWithValue("@UserId", request.UserId)
                insertReferenceValueCommand.Parameters.AddWithValue("@Reason", request.ReasonForChange)
                insertReferenceValueCommand.ExecuteNonQuery()

            End Using
        End Using

    End Sub

    Private Sub DeleteReferenceValue(ByVal request As ReferenceValueChange)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using deleteReferenceValueCommand As SqlCommand = connection.CreateCommand
                deleteReferenceValueCommand.CommandType = CommandType.StoredProcedure
                deleteReferenceValueCommand.CommandText = "spdReferenceValue"
                deleteReferenceValueCommand.Parameters.AddWithValue("@ValueId", request.Id)
                deleteReferenceValueCommand.Parameters.AddWithValue("@OldLookupValue", request.OldValue)
                deleteReferenceValueCommand.Parameters.AddWithValue("@UserId", request.UserId)
                deleteReferenceValueCommand.Parameters.AddWithValue("@Reason", request.ReasonForChange)
                deleteReferenceValueCommand.Parameters.AddWithValue("@LastUpdated", request.LastUpdated)
                deleteReferenceValueCommand.ExecuteNonQuery()

            End Using
        End Using

    End Sub

    Private Sub EditReferenceValue(ByVal request As ReferenceValueChange)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using updateReferenceValueCommand As SqlCommand = connection.CreateCommand
                updateReferenceValueCommand.CommandType = CommandType.StoredProcedure
                updateReferenceValueCommand.CommandText = "spuReferenceValue"
                updateReferenceValueCommand.Parameters.AddWithValue("@ValueId", request.Id)
                updateReferenceValueCommand.Parameters.AddWithValue("@NewLookupValue", request.NewValue)
                updateReferenceValueCommand.Parameters.AddWithValue("@UserId", request.UserId)
                updateReferenceValueCommand.Parameters.AddWithValue("@Reason", request.ReasonForChange)
                updateReferenceValueCommand.Parameters.AddWithValue("@LastUpdated", request.LastUpdated)
                updateReferenceValueCommand.ExecuteNonQuery()

            End Using
        End Using

    End Sub

    Private Sub InactivateReferenceValue(ByVal request As ReferenceValueChange)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using inactivateReferenceValueCommand As SqlCommand = connection.CreateCommand
                inactivateReferenceValueCommand.CommandType = CommandType.StoredProcedure
                inactivateReferenceValueCommand.CommandText = "sppReferenceValue"
                inactivateReferenceValueCommand.Parameters.AddWithValue("@ValueId", request.Id)
                inactivateReferenceValueCommand.Parameters.AddWithValue("@UserId", request.UserId)
                inactivateReferenceValueCommand.Parameters.AddWithValue("@Reason", request.ReasonForChange)
                inactivateReferenceValueCommand.Parameters.AddWithValue("@LastUpdated", request.LastUpdated)
                inactivateReferenceValueCommand.ExecuteNonQuery()

            End Using
        End Using

    End Sub

End Class
