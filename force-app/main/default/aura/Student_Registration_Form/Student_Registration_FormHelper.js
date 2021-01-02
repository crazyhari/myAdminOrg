({
	onChangeCheckboxHelper : function(component, event) {
        // Body of helper
        // Logic of function
        console.log("This is helper function");
        //Find component aura id isEligibleCheckbox
		var onChangevalue = component.find("isEligibleCheckbox").get("v.checked");
        //Set component attribute isEligible with new changed display
        component.set("v.isEligible", onChangevalue);
	}
})