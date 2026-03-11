Imports System.Xml
Imports System.Text
Imports System.Data.SqlClient
Imports System.Configuration.ConfigurationManager
Imports System.Reflection

Public Class MainForm

    Private mCodeGenOptionList As List(Of CodeGenOption)

    Private Function GetSourceXml(ByVal storedProcedure As String) As String

        Dim sqlXmlBuilder As New StringBuilder

        Using cn As New SqlConnection(ConnectionStrings("ProfilesDatabase").ConnectionString)
            cn.Open()
            Using cm As SqlCommand = cn.CreateCommand

                cm.CommandType = CommandType.StoredProcedure
                cm.CommandText = storedProcedure
                sqlXmlBuilder.Append("<root datetime=""").Append(Now.ToString()).Append(""">")

                Using dr As SqlDataReader = cm.ExecuteReader()

                    Do
                        While dr.Read()
                            sqlXmlBuilder.Append(dr.Item(0))
                        End While
                    Loop While dr.NextResult()

                End Using
                sqlXmlBuilder.Append("</root>")

            End Using
        End Using

        Return sqlXmlBuilder.ToString()

    End Function

    Private Function GetStylesheet(ByVal identifier As String) As Xsl.XslCompiledTransform
        Dim xslSheet As New Xsl.XslCompiledTransform()
        Dim xslReader As New Xml.XmlTextReader(Assembly.GetExecutingAssembly.GetManifestResourceStream("ProfilesCodeGen." & identifier))

        xslSheet.Load(xslReader)
        xslReader.Close()
        Return xslSheet

    End Function

    Private Function TransformXml(ByVal xmlData As String, ByVal stylesheetName As String) As String

        Dim xslTransform As Xsl.XslCompiledTransform = GetStylesheet(stylesheetName)
        Dim sqlXmlReader As XmlReader = XmlReader.Create(New System.IO.StringReader(xmlData))

        Dim textBuilder As New StringBuilder()
        Dim textWriter As New System.IO.StringWriter(textBuilder)
        xslTransform.Transform(sqlXmlReader, Nothing, textWriter)
        Return textBuilder.ToString().Replace("<?xml version=""1.0"" encoding=""utf-16""?>", String.Empty)
        
    End Function

    Private Function Generate(ByVal storedProcedure As String, ByVal stylesheetName As String) As String

        Return TransformXml(GetSourceXml(storedProcedure), stylesheetName)

    End Function

    Private Sub MainForm_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        mCodeGenOptionList = CodeGenOption.GetList()
        For Each codeGenOption As CodeGenOption In mCodeGenOptionList
            cboCodeGenList.Items.Add(codeGenOption.Name)
        Next
        cboCodeGenList.SelectedIndex = 0

    End Sub

    Private Sub btnGenerate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGenerate.Click

        For Each codeGenOption As CodeGenOption In mCodeGenOptionList
            If codeGenOption.Name.Equals(cboCodeGenList.SelectedItem) Then
                If chkShowSource.Checked Then
                    txtResult.Text = GetSourceXml(codeGenOption.DataSource)
                Else
                    txtResult.Text = Generate(codeGenOption.DataSource, codeGenOption.Transform)
                End If
            End If
        Next

    End Sub

End Class