({
    StudentViewList:function(component, event,helper){
        //component.set("v.StdRecList",true);
        var action = component.get("c.fetchStudentList");
        action.setCallback(this, function(data){
            //alert('data' +data.getReturnValue().length);
            if(data.getReturnValue().length > 0){
                component.set("v.StdRecList",true);
                component.set("v.StudentList",data.getReturnValue());
            }
            
        });       
        $A.enqueueAction(action);
        
    },
    
    SaveRec :function(component, event,helper){
        component.find("Id_spinner").set("v.class" , 'slds-show');
        var newstd = component.get("v.Student");
        var action = component.get("c.SaveStudent");
        action.setParams({
            "std": newstd,
        });
        action.setCallback(this,function(response){
            component.find("Id_spinner").set("v.class" , 'slds-hide');
            var state = response.getState(); 
            //alert('hiii143'+state)
            if(state ==="SUCCESS"){
                component.find("Customtoast").showToastModel('Created successfully', 'success');
                //Redirect to DetailPage
                var navEvt = $A.get("e.force:navigateToSObject");
                navEvt.setParams({
                    "recordId": response.getReturnValue(),
                    "slideDevName": "related"
                });
                navEvt.fire();
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert("Error message: " + 
                              errors[0].message);
                    }
                } 
                else {
                    alert("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
    },
    
    SaveNewRec :function(component, event,helper){
        component.find("Id_spinner").set("v.class" , 'slds-show');
        var newstd = component.get("v.Student");
        var action =component.get("c.savenewstudent");
        
        action.setParams({
            "newobj" : newstd,
        });
        action.setCallback(this,function(response){
            component.find("Id_spinner").set("v.class" , 'slds-hide');
            var State = response.getState();
            //alert('hiii---->'+State);
            if(State ==="SUCCESS"){
                component.find("Customtoast").showToastModel('Created successfully', 'success');
                //component.set("v.Student","");
                helper.StudentViewList(component,event,helper);
                component.set("v.Student",undefined);
                
                component.set("v.NameError",false);
                component.set("v.EmailError",false);
                component.set("v.PhoneError",false);
                component.set("v.StateError",false);
                component.set("v.GenderError",false);
                component.set("v.DateError",false);
                component.set("v.AddressError",false);
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert("Error message: " + 
                              errors[0].message);
                    }
                } 
                else {
                    alert("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
    },
    
    fetchpickListVal: function(component, event, helper, elementId, fieldName) {
        //alert('elementId --> '+elementId);
        //alert('fieldName --> '+fieldName);
        var action = component.get("c.getselectOptions");
        //alert(action);
        action.setParams({
            objectName : component.get("v.StudentPickLists"),
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
            else if (response.getState() === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert("Error message: " + 
                              errors[0].message);
                    }
                } 
                else {
                    alert("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
    },
    
    DisplayEditViewDetail:function(component, event,helper){
        component.find("Id_spinner").set("v.class" , 'slds-show');
        component.set("v.EditPopup",true);
        var editrecid = event.currentTarget.dataset.id;
        //alert('editrecid'+editrecid);
        var action = component.get("c.EditStudentRec");
        action.setParams({
            "editstudentid" : editrecid
        });
        action.setCallback(this,function(response){
            component.find("Id_spinner").set("v.class" , 'slds-hide');
            var state = response.getState();
            //alert(response.getReturnValue());
            if(state == "SUCCESS"){
                var result = response.getReturnValue();
                component.set("v.EditRecValue",result);
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert("Error message: " + 
                              errors[0].message);
                    }
                } 
                else {
                    alert("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
    },
    
    EditUpdateStudentRecords:function(component, event){
        component.find("Id_spinner").set("v.class" , 'slds-show');
        var records = component.get("v.EditRecValue");
        //var editrecid = event.currentTarget.dataset.id;
        var action = component.get("c.UpdateStudentRec");
        action.setParams({
            "UpdateStdRec" : records
        });
        action.setCallback(this,function(response){
            component.find("Id_spinner").set("v.class" , 'slds-hide');
            var state = response.getState();
            //alert('test1');
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                if(storeResponse == 'Successfully updated'){
                    component.find("Customtoast").showToastModel('Updated Successfully', 'success')
                    component.set("v.EditPopup",false);
                    component.set("v.EditNameError",false);
                    component.set("v.EditEmailError",false);
                    component.set("v.EditPhoneError",false);
                    component.set("v.EditStateError",false);
                    component.set("v.EditGenderError",false);
                    component.set("v.EditDateError",false);
                    component.set("v.EditAddressError",false);
                    //this.StudentViewList(component,event,helper);
                    $A.get('e.force:refreshView').fire();
                }
            }
            else if (state === "INCOMPLETE") {
                alert('Response is Incompleted');
            }else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert("Error message: " + 
                              errors[0].message);
                    }
                } else {
                    alert("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
    }
})