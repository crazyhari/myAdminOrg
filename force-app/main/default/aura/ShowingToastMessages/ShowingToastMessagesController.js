({
	showInfo : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : 'Info',
            message: 'This is an information message.',
            duration:' 5000',
            key: 'info_alt',
            type: 'info',
            mode: 'dismissible'
        });
        toastEvent.fire();
    },
    showSuccess : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");    
        toastEvent.setParams({
            "title": "Title",
            "message": "This line is first Success message. \n This line is second Success message. \n This line is third Success message.",
            "type": "success"
        });
        toastEvent.fire();     
    },
    showError : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : 'Error',
            message:'This is an error message',
            duration:' 5000',
            key: 'info_alt',
            type: 'error',
            mode: 'pester'
        });
        toastEvent.fire();
    },
    showWarning : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : 'Warning',
            message: 'This is a warning message.',
            duration:' 5000',
            key: 'info_alt',
            type: 'warning',
            mode: 'sticky'
        });
        toastEvent.fire();
    }
})