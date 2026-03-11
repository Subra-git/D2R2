Imports System.Web.UI
Imports Microsoft.VisualBasic
Imports ProfilesLibrary

Namespace Profiles.WebControls.AnswerControls

    Public Class ListFieldValueRenderer
        Implements IRenderer

        Private mDataItems As List(Of ListDataItem)

        Friend Shared Function GetListFieldValueRenderer(ByVal currentFieldValue As FieldValueBase) As ListFieldValueRenderer

            Dim dataItems As List(Of ListDataItem)

            If TypeOf currentFieldValue Is BooleanFieldValue Then
                dataItems = GetBooleanDataItems(DirectCast(currentFieldValue, BooleanFieldValue))
            ElseIf currentFieldValue.ReferenceTableIsMaintainable Then
                dataItems = GetReferenceListItems(currentFieldValue)
            Else
                dataItems = GetLookupListItems(currentFieldValue)
            End If

            Return New ListFieldValueRenderer(dataItems)

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

        Private Sub New(ByVal dataItems As List(Of ListDataItem))
            mDataItems = dataItems
        End Sub

        Public Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter) Implements IRenderer.Render

            'The checkboxes are placed in a table, three to each row
            Dim currentCheckbox As Integer

            'begin the table
            writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "95%")
            writer.RenderBeginTag(HtmlTextWriterTag.Table)
            writer.RenderBeginTag(HtmlTextWriterTag.Tbody)

            'RenderSpacerRow(writer)

            writer.RenderBeginTag(HtmlTextWriterTag.Tr)

            writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)

            For Each item As ListDataItem In mDataItems

                If item.IsChecked Then
                    writer.AddAttribute(HtmlTextWriterAttribute.Src, "Images/CheckboxSelected.png")
                    writer.AddAttribute(HtmlTextWriterAttribute.Alt, "Checkbox Selected")
                Else
                    writer.AddAttribute(HtmlTextWriterAttribute.Src, "Images/CheckboxUnselected.png")
                    writer.AddAttribute(HtmlTextWriterAttribute.Alt, "Checkbox Unselected")
                End If
                'draw an image of a checkbox
                writer.RenderBeginTag(HtmlTextWriterTag.Img)
                writer.RenderEndTag() '/Img

                writer.RenderEndTag() '/Td
                'plus the text next to it
                writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "33%")
                writer.RenderBeginTag(HtmlTextWriterTag.Td)
                writer.RenderBeginTag(HtmlTextWriterTag.Span)
                writer.Write(item.Name)
                writer.RenderEndTag() '</Span>

                currentCheckbox += 1
                If currentCheckbox < mDataItems.Count Then
                    writer.RenderEndTag() '/Td

                    If currentCheckbox Mod 3 = 0 Then
                        writer.RenderEndTag() '/Tr
                        writer.RenderBeginTag(HtmlTextWriterTag.Tr)
                    End If
                    writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
                    writer.RenderBeginTag(HtmlTextWriterTag.Td)
                End If

            Next

            writer.RenderEndTag() '/Td

            'add spacers to rows that do not have enough checkboxes to fill the line
            If currentCheckbox Mod 3 > 0 Then
                For currentSpacer As Integer = 1 To 3 - (currentCheckbox Mod 3)
                    RenderSpacerBlock(writer, "&nbsp;")
                Next
            End If
            writer.RenderEndTag() '/Tr
            writer.RenderEndTag() '/TBody
            writer.RenderEndTag() '/Table

        End Sub

        Private Sub RenderSpacerBlock(ByVal writer As HtmlTextWriter)
            RenderSpacerBlock(writer, String.Empty)
        End Sub

        Private Sub RenderSpacerBlock(ByVal writer As HtmlTextWriter, ByVal label As String)

            writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)
            writer.AddAttribute(HtmlTextWriterAttribute.Src, "Images/CheckboxSpacer.png")
            writer.AddAttribute(HtmlTextWriterAttribute.Alt, "")
            writer.RenderBeginTag(HtmlTextWriterTag.Img)
            writer.RenderEndTag() '/Img
            writer.RenderEndTag() '/Td
            writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
            writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "33%")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)
            writer.Write(label)
            writer.RenderEndTag() '/Td

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

End Namespace
