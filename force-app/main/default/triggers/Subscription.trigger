trigger Subscription on Subscription__c (before insert,before update) {
    if(trigger.isInsert && trigger.isBefore){
            subscriptionNew.method(trigger.new);
    }
}