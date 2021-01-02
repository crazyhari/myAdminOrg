({
    doInit : function(component, event, helper) {
        helper.getActionItems(component, event, helper);
    },
    
    GetAllActionItems : function(component, event, helper){
        helper.getAllActionItems(component, event, helper);
    },
    
    CloseModel : function(component, event, helper){
        component.set("v.DisplayAllRecords",false); 
    },
    
    GoToComp : function(component, event, helper){
        var selectedItem = event.currentTarget;
        var ActionItemId= selectedItem.dataset.variablename;
        var evt = $A.get("e.force:navigateToComponent");
        evt.setParams({
            componentDef : "c:ProjectActionItemDetail",  
            componentAttributes: {
                 "actionitemrecordId":ActionItemId
            }
        });
        evt.fire();
    },
    
    DisplayActionView : function(component, event, helper){
	    var selectedItem = event.currentTarget;
        var SelectedActionId= selectedItem.dataset.variablename;
        var action = component.get("c.GetinnerOpportunityDetails");
        action.setParams({
            ActionId : SelectedActionId
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.IsSpinner",false);
                var OpportunityAndOpportunityList = response.getReturnValue();
                var evt = $A.get("e.force:navigateToComponent");
                evt.setParams({
                    componentDef : "c:ProjectRecordDetailsComp",  
                    componentAttributes: {
                         "DisplayAction":true,
                         "ActionRec":OpportunityAndOpportunityList.ActionRecord,
                         "OpportunityList":OpportunityAndOpportunityList.OpportunityList,
                         "ActionId":SelectedActionId,
                         "SelectedViewId":SelectedActionId
                    }
                });
                evt.fire();
            }
        });
        $A.enqueueAction(action);
	}
})