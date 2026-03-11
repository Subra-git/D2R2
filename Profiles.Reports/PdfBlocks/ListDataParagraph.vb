Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Friend Class ListDataParagraph
    Inherits Table

    Friend Shared Function GetListDataParagraph(ByVal currentFieldValue As FieldValueBase, ByVal base As PdfBase) As ListDataParagraph

        Dim dataItems As List(Of ListDataItem)

        If TypeOf currentFieldValue Is BooleanFieldValue Then
            dataItems = GetBooleanDataItems(DirectCast(currentFieldValue, BooleanFieldValue))
        ElseIf currentFieldValue.ReferenceTableIsMaintainable Then
            dataItems = GetReferenceListItems(currentFieldValue)
        Else
            dataItems = GetLookupListItems(currentFieldValue)
        End If

        Return New ListDataParagraph(dataItems, base)

    End Function

    Private Shared Function GetBooleanDataItems(ByVal currentFieldValue As BooleanFieldValue) As List(Of ListDataItem)

        Dim dataItems As New List(Of ListDataItem)
        Dim name As String
        Dim isChecked As Boolean

        name = "Yes"
        isChecked = Not currentFieldValue.IsEmpty AndAlso currentFieldValue.FieldValue.Value
        dataItems.Add(New ListDataItem(name, isChecked))

        name = "No"
        isChecked = Not currentFieldValue.IsEmpty AndAlso Not currentFieldValue.FieldValue.Value
        dataItems.Add(New ListDataItem(name, isChecked))

        Return dataItems

    End Function

    Private Shared Function GetReferenceListItems(ByVal currentFieldValue As FieldValueBase) As List(Of ListDataItem)

        Dim dataItems As New List(Of ListDataItem)
        Dim name As String
        Dim isChecked As Boolean

        Dim referenceList As ReferenceValueInfoList = ReferenceValueInfoList.GetList(currentFieldValue.ReferenceTableId)
        For Each referenceItem As ReferenceValueInfo In referenceList
            isChecked = currentFieldValue.ContainsGuid(referenceItem.Id)
            If referenceItem.IsActive OrElse isChecked Then
                name = referenceItem.Value
                If Not referenceItem.IsActive Then
                    name += " (inactive)"
                End If
                dataItems.Add(New ListDataItem(name, isChecked))
            End If
        Next

        Return dataItems

    End Function

    Private Shared Function GetLookupListItems(ByVal currentFieldValue As FieldValueBase) As List(Of ListDataItem)

        Dim dataItems As New List(Of ListDataItem)
        Dim name As String
        Dim isChecked As Boolean

        Dim lookup As LookupList = LookupList.GetList(currentFieldValue.ReferenceTableId)
        For Each lookupItem As LookupList.NameValuePair In lookup
            name = lookupItem.Value
            isChecked = currentFieldValue.ContainsGuid(lookupItem.Key)
            dataItems.Add(New ListDataItem(name, isChecked))
        Next

        Return dataItems

    End Function

    Private Sub New()
        '
    End Sub

    Private Sub New(ByVal dataItems As List(Of ListDataItem), ByVal base As PdfBase)

        Me.DoNotBreak = True

        Dim valuesPerRow As Integer = 3
        Dim maxValueLength As Integer = 0
        Dim cellWidth As Integer

        Dim comparisonPdf As ProfileVersionComparisonReportPdf = TryCast(base, ProfileVersionComparisonReportPdf)
        If comparisonPdf IsNot Nothing Then    'comparison report
            cellWidth = 100
        Else    'profile report
            cellWidth = 150
        End If

        Dim listRow As Row = Me.Rows.Add()
        listRow.Padding.Top = 5
        Dim itemCount As Integer = 0
        For Each dataItem As ListDataItem In dataItems
            Dim itemCell As Cell = listRow.Cells.Add()
            itemCell.VerticalAlignment = VerticalAlignment.Middle 'align the checkboxes to the middle to handle labels that wrap
            Dim itemImage As Image
            If dataItem.IsChecked Then
                itemImage = New Image(base.CheckboxSelected)
            Else
                itemImage = New Image(base.CheckboxUnselected)
            End If
            itemCell.Paragraphs.Add(itemImage)
            Dim itemTextCell As Cell = listRow.Cells.Add()
            itemTextCell.VerticalAlignment = VerticalAlignment.Middle 'align to the middle to handle labels that wrap
            itemTextCell.Padding = New Spacing(0, 3, 3, 0) 'give the list items some padding left and right
            itemTextCell.PreferredWidth = cellWidth
            itemTextCell.Fixed = True
            Dim itemText As New FormattedXhtmlParagraph(dataItem.Name)
            itemTextCell.Paragraphs.Add(itemText)

            itemCount += 1
            If itemCount Mod valuesPerRow = 0 Then
                listRow = Me.Rows.Add()
                listRow.Padding.Top = 5
            End If
        Next

    End Sub

    Private Class ListDataItem

        Private mName As String
        Private mIsChecked As Boolean

        Public ReadOnly Property Name() As String
            Get
                Return mName
            End Get
        End Property

        Public ReadOnly Property IsChecked() As Boolean
            Get
                Return mIsChecked
            End Get
        End Property

        Public Sub New(ByVal name As String)
            Me.New(name, False)
        End Sub

        Public Sub New(ByVal name As String, ByVal isChecked As Boolean)
            mName = name
            mIsChecked = isChecked
        End Sub

    End Class

End Class
