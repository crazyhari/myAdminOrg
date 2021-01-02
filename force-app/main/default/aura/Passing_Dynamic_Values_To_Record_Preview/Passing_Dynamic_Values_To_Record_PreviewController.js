({
    doInit : function(component, event, helper) {
        var stringFields = component.get("v.fields");
        var dataArray = [];
        if(stringFields != null && stringFields != ''){
            component.set("v.isShow",true);
            if(stringFields.includes(",")){
                dataArray = stringFields.split(",");
            }
            else{
                dataArray.push(stringFields);
            }
        }
        component.set("v.brokerFields",dataArray);
    }
})