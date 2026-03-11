Imports ProfilesLibrary

Partial Class PrintPrioritisationVariables
    Inherits System.Web.UI.Page


    Private mCurrentPrioritisationMetadata As ProfilePrioritisationMetadata
    Private mCategoryId As Guid = Guid.Empty
    Private mCriterionId As Guid = Guid.Empty

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            mCurrentPrioritisationMetadata = ProfilePrioritisationMetadata.GetPrioritisationMetadata
            If Not Request.QueryString("categoryid") Is Nothing Then
                mCategoryId = New Guid(Request.QueryString("categoryid"))
                repeatPrioritisationCategory.DataBind()
            End If
        End If
    End Sub

    Protected Sub dsPrioritisationCategory_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsPrioritisationCategory.SelectObject
        e.BusinessObject = mCurrentPrioritisationMetadata.Categories.GetById(mCategoryId)
    End Sub

    Protected Sub dsPrioritisationCriterion_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsPrioritisationCriterion.SelectObject    
        If mCategoryId <> Guid.Empty Then
            e.BusinessObject = mCurrentPrioritisationMetadata.Categories.GetById(mCategoryId).Criterion
        End If
    End Sub

    Protected Sub dsPrioritisationCriterionValue_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsPrioritisationCriterionValue.SelectObject
        If mCriterionId <> Guid.Empty Then
            e.BusinessObject = mCurrentPrioritisationMetadata.Categories.GetById(mCategoryId).Criterion.GetById(mCriterionId).Values
        End If
    End Sub


    Protected Sub repeatPrioritisationCategory_ItemCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles repeatPrioritisationCategory.ItemCreated
        If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then            
            Dim criterionRepeater As Repeater
            criterionRepeater = DirectCast(e.Item.FindControl("repeatPrioritisationCriterion"), Repeater)

            AddHandler criterionRepeater.ItemCreated, AddressOf repeatPrioritisationCriterion_ItemCreated
        End If
    End Sub

    Protected Sub repeatPrioritisationCriterion_ItemCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs)
        If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
            mCriterionId = DirectCast(e.Item.DataItem, ProfilePrioritisationCriterion).Id
        End If
    End Sub

End Class
