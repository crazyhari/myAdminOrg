({
       onChangeCkeckbox : function(component, event, helper) {
            //Body of function
           //Call another function defined in helper     
          console.log("This is controller function");
          helper.onChangeCheckboxHelper(component, event);
       }
})