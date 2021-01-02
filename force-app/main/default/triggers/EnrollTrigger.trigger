trigger EnrollTrigger on Enrollment__c (after insert) {
    if(trigger.isInsert && trigger.isAfter){
         EnrollTriggerHandler.afterInsert();
    }
}