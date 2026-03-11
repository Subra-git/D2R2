Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ReferenceValueInfoList
    Inherits ReadOnlyListBase(Of ReferenceValueInfoList, ReferenceValueInfo)

    Private mMaxReferenceValueLength As Integer

    Public ReadOnly Property MaxReferenceValueLength() As Integer
        Get
            If mMaxReferenceValueLength = 0 Then
                For Each item As ReferenceValueInfo In Me
                    If item.Value.Length > mMaxReferenceValueLength Then
                        mMaxReferenceValueLength = item.Value.Length
                    End If
                Next
            End If
            Return mMaxReferenceValueLength
        End Get
    End Property

#Region " Authorization Rules "

    Public Shared Function CanGetList() As Boolean
        Return True 'any user can get this list, even if anonymous
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetList(ByVal referenceTableId As Guid) As ReferenceValueInfoList

        If Not CanGetList() Then
            Throw New System.Security.SecurityException("You do not have permission to get a list of reference values")
        End If

        If System.Web.HttpContext.Current IsNot Nothing Then

            Dim cache As Dictionary(Of Guid, ReferenceValueInfoList)

            If System.Web.HttpContext.Current.Items("ReferenceValueCache") Is Nothing Then
                cache = New Dictionary(Of Guid, ReferenceValueInfoList)
                System.Web.HttpContext.Current.Items("ReferenceValueCache") = cache
            Else
                cache = DirectCast(System.Web.HttpContext.Current.Items("ReferenceValueCache"), Dictionary(Of Guid, ReferenceValueInfoList))
            End If

            If Not cache.ContainsKey(referenceTableId) Then
                cache(referenceTableId) = DataPortal.Fetch(Of ReferenceValueInfoList)(New ReferenceDataCriteria(referenceTableId))
            End If
            Return cache(referenceTableId)

        Else

            Return DataPortal.Fetch(Of ReferenceValueInfoList)(New ReferenceDataCriteria(referenceTableId))

        End If

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class ReferenceDataCriteria
        Private mReferenceTableId As Guid
        Public ReadOnly Property ReferenceTableId() As Guid
            Get
                Return mReferenceTableId
            End Get
        End Property
        Public Sub New(ByVal referenceTableId As Guid)
            mReferenceTableId = referenceTableId
        End Sub
    End Class

    Public Function GetById(ByVal id As Guid) As ReferenceValueInfo

        For Each currentValueInfoList As ReferenceValueInfo In Me
            If currentValueInfoList.Id = id Then
                Return currentValueInfoList
            End If
        Next

        Return Nothing

    End Function

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As ReferenceDataCriteria)

        RaiseListChangedEvents = False
        IsReadOnly = False

        Dim db As ServiceContracts.IReferenceValueService = DataFactory.GetReferenceValueService
        Dim referenceValues As List(Of DataContracts.ReferenceValue) = db.GetReferenceValues( _
            New DataContracts.GetReferenceValuesRequest(criteria.ReferenceTableId) _
        )

        For Each referenceValue As DataContracts.ReferenceValue In referenceValues
            Add(ReferenceValueInfo.GetReferenceValueInfo(referenceValue))
        Next


        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
