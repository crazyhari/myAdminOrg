({
    getActionItems : function(component, event, helper) {
        component.set("v.IsSpinner",true);
        var action = component.get("c.GetOpportunityDetails");
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log('Response Status--->'+state);
            var FirstFourProducts=[];
            if (state === "SUCCESS") {
                component.set("v.IsSpinner",false);
                var OpportunityList = response.getReturnValue();
                if(OpportunityList.length > 3){
                    for (var i = 0; i < 3; i++) {
                        FirstFourProducts.push(OpportunityList[i]);
                    }
                    component.set("v.DisplayTotalRecsCount", true);
                }else{
                    for (var i = 0; i < OpportunityList.length; i++) {
                        FirstFourProducts.push(OpportunityList[i]);
                    }
                }
                component.set("v.OpportunityList", FirstFourProducts);
                component.set("v.TotalRecords", OpportunityList.length);
            }
        });
        $A.enqueueAction(action);
    },
    
    getAllActionItems : function(component, event, helper) {
        component.set("v.IsSpinner",true);
        var action = component.get("c.GetOpportunityDetails");
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log('Response Status--->'+state);
            var FirstFourProducts=[];
            if (state === "SUCCESS") {
                component.set("v.IsSpinner",false);
                var OpportunityList = response.getReturnValue();
                component.set("v.AllOpportunityList", OpportunityList);
                component.set("v.DisplayAllRecords",true);
            }
        });
        $A.enqueueAction(action);
    }
})