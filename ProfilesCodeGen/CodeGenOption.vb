Imports System.Xml
Imports System.Reflection

Friend Class CodeGenOption

    Private mName As String
    Private mDataSource As String
    Private mTransform As String

    Public ReadOnly Property Name() As String
        Get
            Return mName
        End Get
    End Property

    Public ReadOnly Property DataSource() As String
        Get
            Return mDataSource
        End Get
    End Property

    Public ReadOnly Property Transform() As String
        Get
            Return mTransform
        End Get
    End Property

    Friend Sub New(ByVal name As String, ByVal dataSource As String, ByVal transform As String)
        mName = name
        mDataSource = dataSource
        mTransform = transform
    End Sub

    Public Shared Function GetList() As List(Of CodeGenOption)

        Dim codeGenOptionList As New List(Of CodeGenOption)

        Dim xmlDoc As New XmlDocument()
        xmlDoc.Load(Assembly.GetExecutingAssembly.GetManifestResourceStream("ProfilesCodeGen.CodeGenList.xml"))
        For Each optionElement As XmlElement In xmlDoc.GetElementsByTagName("Option")
            codeGenOptionList.Add(New CodeGenOption(optionElement.GetAttribute("Name"), optionElement.GetAttribute("DataSource"), optionElement.GetAttribute("Transform")))
        Next
        Return codeGenOptionList

    End Function

End Class
