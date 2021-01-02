({
    fetchpickListVal: function(component, event, helper, elementId, fieldName) {
        //alert('elementId --> '+elementId);
        //alert('fieldName --> '+fieldName);
        var action = component.get("c.getselectOptions");
        //alert(action);
        action.setParams({
            objectName : component.get("v.opp"), 
            fieldName : fieldName
        });
        var opts = [];
        //alert('hiiiiiii 123');
        action.setCallback(this, function(response) {
            //alert('State --> '+response.getState());
            if (response.getState() === "SUCCESS") {
                //alert('hiiiiiii');
                var allValues = response.getReturnValue();
 
                if (allValues != undefined && allValues.length > 0) {
                    opts.push({
                        class: "optionClass",
                        label: "--- None ---",
                        value: ""
                    });
                }  
                for (var i = 0; i < allValues.length; i++) {
                    opts.push({
                        class: "optionClass",
                        label: allValues[i],
                        value: allValues[i]
                    });
                }
                component.find(elementId).set("v.options", opts);
              //  alert('hiiiiiii');
            } 
        });
        $A.enqueueAction(action);
    },
    
})