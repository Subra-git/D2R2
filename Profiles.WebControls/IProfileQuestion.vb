Imports ProfilesLibrary

''' <summary>
''' This interface is implemented by controls that present a question to the user and enable them to answer it.
''' </summary>
Public Interface IProfileQuestion

    ''' <summary>
    ''' The question within the profile that the control is mapped to
    ''' </summary>
    Property Question() As QuestionBase

    ''' <summary>
    ''' Sets the values held in the business layer to the values displayed in the user interface 
    ''' </summary>
    Sub Save()

    ''' <summary>
    ''' Closes any open sub-panels for this question
    ''' </summary>
    Sub CloseSubPanel()

End Interface
