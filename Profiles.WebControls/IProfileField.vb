Imports ProfilesLibrary

''' <summary>
''' This interface is implemented by controls that present a field value to the user and enable them to edit it.
''' </summary>
Public Interface IProfileField

    ''' <summary>
    ''' The field within the profile that the control is mapped to
    ''' </summary>
    Property Field() As FieldMetadataWrapper

    ''' <summary>
    ''' Sets the value displayed in the user interface to the value held in the business layer
    ''' </summary>
    Sub UpdateUIValue(ByVal value As FieldValueBase)

    ''' <summary>
    ''' Sets the value held in the business layer to the value displayed in the user interface 
    ''' </summary>
    Sub Save(ByVal value As FieldValueBase)

End Interface
