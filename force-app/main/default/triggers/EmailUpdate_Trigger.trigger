trigger EmailUpdate_Trigger on Contact (after insert) {
    if(trigger.isInsert && trigger.isAfter){
        EmailUpadate eu = new EmailUpadate();
        eu.callme(trigger.new);
    }
}