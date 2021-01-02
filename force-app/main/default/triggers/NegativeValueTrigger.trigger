trigger NegativeValueTrigger on Opportunity (before insert,before update) {
    NegativeValuesErrorTriggerHandler.NegativeError(Trigger.New);
}