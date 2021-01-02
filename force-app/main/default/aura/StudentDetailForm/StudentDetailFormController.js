({
    doInit : function(component, event, helper) {
        //helper.studentrecs(component, event);
        helper.fetchpickListVal(component, event, helper, 'StateId', 'State__c');
        helper.fetchpickListVal(component, event, helper, 'GenderId', 'Gender__c');
        
        helper.StudentViewList(component,event,helper);
    },
    
    /*handleMenuSelect: function(c, e, h) {
        console.log('handleMenuSelect function called');
        var menuValue = e.detail.menuItem.get("v.accesskey");
        console.log('menuValue ====>> '+menuValue);
        switch(menuValue) {
            case "1": h.doEdit(c, e, h); break;
            case "2": h.doDelete(c, e, h); break;
        }
    },*/
    
    deleterec : function(component, event) {
        component.find("Id_spinner").set("v.class" , 'slds-show');
        var action = component.get("c.deleteStudent");
        var stdId = event.target.id;
        //alert('stdId' +stdId);
        action.setParams({
            "StudentId" : stdId
        });
        action.setCallback(this, function(response) {
            //component.set("v.StudentList",response.getReturnValue());
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                component.set("v.StudentList",result);
                $A.get('e.force:refreshView').fire();
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
    
    close : function (component, event, helper) {
        component.find("Id_spinner").set("v.class" , 'slds-hide');
        component.set("v.NameError",false);
        component.set("v.EmailError",false);
        component.set("v.PhoneError",false);
        component.set("v.StateError",false);
        component.set("v.GenderError",false);
        component.set("v.DateError",false);
        component.set("v.AddressError",false);
        
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": "/lightning/o/Student__c/list?filterName=Recent"
        });
        urlEvent.fire();
    },
    
    saveNew:function(component,event,helper){
        component.find("Id_spinner").set("v.class" , 'slds-show');
        var NameRec = component.find("NameId").get("v.value");
        var EmailRec = component.find("EmailId").get("v.value");
        var PhoneRec = component.find("PhoneId").get("v.value");
        var StateRec = component.find("StateId").get("v.value");
        var GenderRec = component.find("GenderId").get("v.value");
        var DateRec = component.find("DateId").get("v.value");
        var AddressRec = component.find("AddressId").get("v.value");
        if(NameRec != null && NameRec != ''
           && EmailRec != null && EmailRec != ''
           && PhoneRec != null && PhoneRec != ''
           && StateRec != '--- None ---' && StateRec != ''
           && GenderRec != '--- None ---' && GenderRec != ''
           && DateRec != null && DateRec != ''
           && AddressRec != null && AddressRec != ''){
            
            helper.SaveNewRec(component,event,helper);
        }else{
            component.find("Id_spinner").set("v.class" , 'slds-hide');
            //alert('NameRec'+NameRec);
            //alert('StateRec'+StateRec);
            if(NameRec == null || NameRec == ''){
                component.set("v.NameError",true); 
            }
            else{
                component.set("v.NameError",false);
            }
            if(EmailRec == null || EmailRec == ''){
                component.set("v.EmailError",true);  
            }
            else{
                component.set("v.EmailError",false);
            }
            if(PhoneRec == null || PhoneRec == ''){
                component.set("v.PhoneError",true);  
            }
            else{
                component.set("v.PhoneError",false);
            }
            if(StateRec == '--- None ---' || StateRec == ''){
                component.set("v.StateError",true);  
            }
            else{
                component.set("v.StateError",false);
            }
            if(GenderRec == '--- None ---' || GenderRec == ''){
                component.set("v.GenderError",true);  
            }
            else{
                component.set("v.GenderError",false);
            }
            if(DateRec == null || DateRec == ''){
                component.set("v.DateError",true);  
            }
            else{
                component.set("v.DateError",false);
            }
            if(AddressRec == null || AddressRec == ''){
                component.set("v.AddressError",true);  
            }
            else{
                component.set("v.AddressError",false);
            }
        }
    },
    
    save: function(component, event, helper) {
        component.find("Id_spinner").set("v.class" , 'slds-show');
        var NameRec = component.find("NameId").get("v.value");
        var EmailRec = component.find("EmailId").get("v.value");
        var PhoneRec = component.find("PhoneId").get("v.value");
        var StateRec = component.find("StateId").get("v.value");
        var GenderRec = component.find("GenderId").get("v.value");
        var DateRec = component.find("DateId").get("v.value");
        var AddressRec = component.find("AddressId").get("v.value");
        //alert('StateRec'+StateRec);
        if(NameRec != null && NameRec != ''
           && EmailRec != null && EmailRec != ''
           && PhoneRec != null && PhoneRec != ''
           && StateRec != '--- None ---' && StateRec != ''
           && GenderRec != '--- None ---' && GenderRec != ''
           && DateRec != null && DateRec != ''
           && AddressRec != null && AddressRec != ''){
            
            helper.SaveRec(component,event,helper);
            
        }else{
            component.find("Id_spinner").set("v.class" , 'slds-hide');
            if(NameRec == null || NameRec == ''){
                component.set("v.NameError",true);  
            }
            else{
                component.set("v.NameError",false);
            }
            if(EmailRec == null || EmailRec == ''){
                component.set("v.EmailError",true);  
            }
            else{
                component.set("v.EmailError",false);
            }
            if(PhoneRec == null || PhoneRec == ''){
                component.set("v.PhoneError",true);  
            }
            else{
                component.set("v.PhoneError",false);
            }
            if(StateRec == '--- None ---' || StateRec == ''){
                component.set("v.StateError",true);  
            }
            else{
                component.set("v.StateError",false);
            }
            if(GenderRec == '--- None ---' || GenderRec == ''){
                component.set("v.GenderError",true);  
            }
            else{
                component.set("v.GenderError",false);
            }
            if(DateRec == null || DateRec == ''){
                component.set("v.DateError",true);  
            }
            else{
                component.set("v.DateError",false);
            }
            if(AddressRec == null || AddressRec == ''){
                component.set("v.AddressError",true);  
            }
            else{
                component.set("v.AddressError",false);
            }
        }
    },
    
    EditRec: function(component, event, helper) {
        helper.fetchpickListVal(component, event, helper, 'EditStateId', 'State__c');
        helper.fetchpickListVal(component, event, helper, 'EditGenderId', 'Gender__c');
        //component.set("v.EditPopup",true);
        component.set("v.NameError",false);
        component.set("v.EmailError",false);
        component.set("v.PhoneError",false);
        component.set("v.StateError",false);
        component.set("v.GenderError",false);
        component.set("v.DateError",false);
        component.set("v.AddressError",false);
        
        component.set("v.EditNameError",false);
        component.set("v.EditEmailError",false);
        component.set("v.EditPhoneError",false);
        component.set("v.EditStateError",false);
        component.set("v.EditGenderError",false);
        component.set("v.EditDateError",false);
        component.set("v.EditAddressError",false);
        helper.DisplayEditViewDetail(component,event,helper);
    },
    
    UpdateEditRec: function(component, event, helper) {
        component.find("Id_spinner").set("v.class" , 'slds-show');
        var NameRec = component.find("EditNameId").get("v.value");
        var EmailRec = component.find("EditEmailId").get("v.value");
        var PhoneRec = component.find("EditPhoneId").get("v.value");
        var StateRec = component.find("EditStateId").get("v.value");
        var GenderRec = component.find("EditGenderId").get("v.value");
        var DateRec = component.find("EditDateId").get("v.value");
        var AddressRec = component.find("EditAddressId").get("v.value");
        if(NameRec != null && NameRec != ''
           && EmailRec != null && EmailRec != ''
           && PhoneRec != null && PhoneRec != ''
           && StateRec != '--- None ---' && StateRec != ''
           && GenderRec != '--- None ---' && GenderRec != ''
           && DateRec != null && DateRec != ''
           && AddressRec != null && AddressRec != ''){
            helper.EditUpdateStudentRecords(component, event, helper);
        }else{
            component.find("Id_spinner").set("v.class" , 'slds-hide');
            if(NameRec == null || NameRec == ''){
                component.set("v.EditNameError",true);  
            }
            else{
                component.set("v.EditNameError",false);
            }
            if(EmailRec == null || EmailRec == ''){
                component.set("v.EditEmailError",true);  
            }
            else{
                component.set("v.EditEmailError",false);
            }
            if(PhoneRec == null || PhoneRec == ''){
                component.set("v.EditPhoneError",true);  
            }
            else{
                component.set("v.EditPhoneError",false);
            }
            if(StateRec == '--- None ---' || StateRec == ''){
                component.set("v.EditStateError",true);  
            }
            else{
                component.set("v.EditStateError",false);
            }
            if(GenderRec == '--- None ---' || GenderRec == ''){
                component.set("v.EditGenderError",true);  
            }
            else{
                component.set("v.EditGenderError",false);
            }
            if(DateRec == null || DateRec == ''){
                component.set("v.EditDateError",true);  
            }
            else{
                component.set("v.EditDateError",false);
            }
            if(AddressRec == null || AddressRec == ''){
                component.set("v.EditAddressError",true);  
            }
            else{
                component.set("v.EditAddressError",false);
            }
        }
    },
    
    closeEditModel : function (component, event, helper) {
        component.find("Id_spinner").set("v.class" , 'slds-hide');
        component.set("v.EditPopup",false);
        component.set("v.NameError",false);
        component.set("v.EmailError",false);
        component.set("v.PhoneError",false);
        component.set("v.StateError",false);
        component.set("v.GenderError",false);
        component.set("v.DateError",false);
        component.set("v.AddressError",false);
        
        component.set("v.EditNameError",false);
        component.set("v.EditEmailError",false);
        component.set("v.EditPhoneError",false);
        component.set("v.EditStateError",false);
        component.set("v.EditGenderError",false);
        component.set("v.EditDateError",false);
        component.set("v.EditAddressError",false);
    }
})