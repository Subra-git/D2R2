Imports Csla
Imports System.ComponentModel
Imports System.Configuration.ConfigurationManager
Imports System.Data.SqlClient
Imports System.Reflection
Public Module GlobalCommon

    Public Function IsValidGuid(ByVal guid As String) As Boolean
        'This function works out whether a Guid is in a valid format

        Try
            Dim newGuid As New Guid(guid)
            Return True
        Catch fex As FormatException
            Return False
        Catch oex As OverflowException
            Return False
        Catch nex As ArgumentNullException
            Return False
        End Try

        Return False

    End Function

    Public Function GuidRequired(ByVal target As Object, ByVal e As Validation.RuleArgs) As Boolean

        Dim value As Guid = CType(CallByName(target, e.PropertyName, CallType.Get), Guid)
        If value.Equals(Guid.Empty) Then
            e.Description = String.Format("Guid value for {0} cannot be empty", e.PropertyName)
            Return False
        End If
        Return True

    End Function

    Public Function GetDataFieldType(ByVal dataTypeName As String) As DataFieldType

        Select Case dataTypeName
            Case "Boolean"
                Return DataFieldType.BooleanType
            Case "List"
                Return DataFieldType.ListType
            Case "Date"
                Return DataFieldType.DateType
            Case "Long Text"
                Return DataFieldType.LongTextType
            Case "Multi Value List"
                Return DataFieldType.MultiValueListType
            Case "Text"
                Return DataFieldType.TextType
            Case "Decimal"
                Return DataFieldType.DecimalType
            Case "Profile Version Data"
                Return DataFieldType.ProfileVersionDataType
            Case "Field Group"
                Return DataFieldType.FieldGroup
        End Select

    End Function

    Friend Sub LogUserContribution(ByVal connection As SqlConnection, ByVal profileVersionId As Guid, ByVal profileSectionId As Guid)
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Using updateCommand As SqlCommand = connection.CreateCommand
            updateCommand.CommandType = CommandType.StoredProcedure
            updateCommand.CommandText = "spiProfileVersionSectionUser"
            updateCommand.Parameters.AddWithValue("@UserId", identity.UserId)
            updateCommand.Parameters.AddWithValue("@ProfileVersionId", profileVersionId)
            updateCommand.Parameters.AddWithValue("@ProfileSectionId", profileSectionId)
            updateCommand.Parameters.AddWithValue("@LastContributionDate", DateTime.Now())
            updateCommand.ExecuteNonQuery()
        End Using
    End Sub


    <Runtime.CompilerServices.Extension()>
    Public Function GetEnumDescription(Of TEnum As Structure)(ByVal value As TEnum) As String
        Dim type As Type = GetType(TEnum)

        If Not type.IsEnum Then
            Throw New ArgumentException("The type parameter must be an Enum.")
        End If

        Dim field As FieldInfo = type.GetField(value.ToString())
        Dim attribute As DescriptionAttribute = DirectCast(System.Attribute.GetCustomAttribute(field, GetType(DescriptionAttribute)), DescriptionAttribute)

        If attribute IsNot Nothing Then
            Return attribute.Description
        Else
            Return value.ToString()
        End If
    End Function

End Module

