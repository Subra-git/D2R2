Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileQuestion
    Inherits BusinessBase(Of ProfileQuestion)

#Region " Business Methods "

    Private mId As Guid
    Private mName As String = String.Empty
    Private mShortName As String = String.Empty
    Private mNonTechnicalName As String = String.Empty
    Private mQuestionNumber As Integer
    Private mUserGuidance As String = String.Empty
    Private mLastUpdated(7) As Byte

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public Property Name() As String
        Get
            Return mName.SanitizeHtml
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mName <> value Then
                mName = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property ShortName() As String
        Get
            Return mShortName
        End Get
    End Property

    Public Property NonTechnicalName() As String
        Get
            Return mNonTechnicalName.SanitizeHtml
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mNonTechnicalName <> value Then
                mNonTechnicalName = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property QuestionNumber() As Integer
        Get
            Return mQuestionNumber
        End Get
    End Property

    Public Property UserGuidance() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mUserGuidance
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mUserGuidance <> value Then
                mUserGuidance = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property LastUpdated() As Byte()
        Get
            Return mLastUpdated
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

#End Region

#Region " Validation Rules "

    Protected Overrides Sub AddBusinessRules()

        ValidationRules.AddRule(AddressOf Validation.CommonRules.StringRequired, "UserGuidance")
        ValidationRules.AddRule(AddressOf Validation.CommonRules.StringRequired, "Name")
        ValidationRules.AddRule(AddressOf Validation.CommonRules.StringMaxLength, New Validation.CommonRules.MaxLengthRuleArgs("Name", 400))
        ValidationRules.AddRule(AddressOf Validation.CommonRules.StringRequired, "NonTechnicalName")
        ValidationRules.AddRule(AddressOf Validation.CommonRules.StringMaxLength, New Validation.CommonRules.MaxLengthRuleArgs("NonTechnicalName", 400))

    End Sub

#End Region

#Region " Authorization Rules "

    Public Overrides Function CanWriteProperty(ByVal propertyName As String) As Boolean

        If propertyName = "UserGuidance" OrElse propertyName = "Name" OrElse propertyName = "NonTechnicalName" Then
            Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
            Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
        End If

        Return False

    End Function

    Public Shared Function CanGetObject() As Boolean
        Return True 'this data is available to all, even anonymous users
    End Function

    Public Shared Function CanEditObject() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetProfileQuestion(ByVal id As Guid) As ProfileQuestion

        If Not CanGetObject() Then
            Throw New System.Security.SecurityException("You do not have permission to view profile question data")
        End If

        Return DataPortal.Fetch(Of ProfileQuestion)(New Criteria(id))

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Public Overrides Function Save() As ProfileQuestion

        If Not CanEditObject() Then
            Throw New System.Security.SecurityException("You do not have permission to make changes to profile question data")
        End If

        Return MyBase.Save()

    End Function

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria
        Private mId As Guid
        Public ReadOnly Property Id() As Guid
            Get
                Return mId
            End Get
        End Property
        Public Sub New(ByVal id As Guid)
            mId = id
        End Sub
    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        Dim db As ServiceContracts.IProfileQuestionService = DataFactory.GetProfileQuestionService()
        Dim question As DataContracts.ProfileQuestionData = db.GetProfileQuestion(New DataContracts.GetProfileQuestionRequest(criteria.Id))

        mId = question.Id
        mName = question.Name
        mShortName = question.ShortName
        mNonTechnicalName = question.NonTechnicalName
        mQuestionNumber = question.QuestionNumber
        mUserGuidance = question.UserGuidance
        mLastUpdated = question.LastUpdated

    End Sub

    Protected Overrides Sub DataPortal_Update()

        Dim db As ServiceContracts.IProfileQuestionService = DataFactory.GetProfileQuestionService()
        mLastUpdated = db.UpdateProfileQuestion(New DataContracts.UpdateProfileQuestionRequest( _
                                                 mId, mName, mShortName, mNonTechnicalName, _
                                                 mQuestionNumber, mUserGuidance, mLastUpdated))

    End Sub

#End Region

End Class

