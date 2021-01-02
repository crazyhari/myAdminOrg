({
    doInit: function(component, event, helper) {
        helper.fetchpickListVal(component, event, helper, 'Stage', 'StageName');
        helper.fetchpickListVal(component, event, helper, 'Type', 'Type');
        helper.fetchpickListVal(component, event, helper, 'Lead Source', 'LeadSource');
        helper.fetchpickListVal(component, event, helper, 'Delivery/Installation', 'DeliveryInstallationStatus__c');
        
        //edit button redirecting funtion
        var recordId = component.get("v.recordId");
	    //alert('recordId ----> '+recordId);
	    var action = component.get("c.editOppRec");
	    action.setParams({
	        "recordId" : recordId
	    });
	    action.setCallback(this, function(response){
	        var state = response.getState();
	        if(state === "SUCCESS"){
	            var result = response.getReturnValue();
                component.set("v.opp", result);
            	component.set("v.isAccount",true);
            	component.set("v.selectedLookUpRecordName",result.Account.Name);
                //alert('data'+result.AccountId)
            } else if (response.getState() == "ERROR") {
            $A.log("Errors", response.getError());
        }
        });
	    $A.enqueueAction(action);
    },
    
    clearAccountSelectedValue : function(component, event, helper){
	    component.set("v.isAccount",false);
	    component.set("v.selectedLookUpRecord", undefined);  
        component.set("v.selectedLookUpRecordName", undefined);
	},
       
    save: function(component, event, helper) {
        component.set("v.Spinner", true);
    	var newopp = component.get("v.opp");
        //alert('-->'+component.get("v.opp.IsPrivate"));
    	var action = component.get("c.saveOpportunity");
        action.setParams({
            "obj": newopp,
            "recordId" :component.get("v.selectedLookUpRecord").Id
        });
        action.setCallback(this,function(response){
            var state = response.getState(); 
            //alert('hiii143'+state)
            if(state ==="SUCCESS"){
                alert('record created successful');
                
                //Redirect to DetailPage
                var navEvt = $A.get("e.force:navigateToSObject");
                navEvt.setParams({
                    "recordId": response.getReturnValue(),
                    "slideDevName": "related"
                });
                navEvt.fire();
            }
            
        });
        $A.enqueueAction(action);

    },
    
    saveNew:function(component,event,helper){
        component.set("v.Spinner", true);
	    var newopp = component.get("v.opp");
	    var action =component.get("c.savenewOpportunity");
	    action.setParams({
	        "newobj" : newopp,
	        "recordId" :component.get("v.selectedLookUpRecord").Id
	    });
	    action.setCallback(this,function(response){
	        var State = response.getState();
	        //alert('hiii---->'+State);
	        if(State ==="SUCCESS"){
	            alert('record inserted successfully');
                component.set("v.opp","");
                component.set("selectedLookUpRecord","");
	        }
	        
	    });
	    $A.enqueueAction(action);
	},

    close : function (component, event, helper) {
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": "/lightning/o/Opportunity/list?filterName=Recent"
        });
        urlEvent.fire();
        
    },
    
})