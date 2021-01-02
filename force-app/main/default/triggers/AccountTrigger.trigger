trigger AccountTrigger on Account (after insert,after update) {
    AccountTriggerHandler handler = new AccountTriggerHandler();
    
    if(trigger.isInsert && trigger.isAfter || trigger.isUpdate && trigger.isAfter){  
        handler.insertAndUpdateAccounts(Trigger.new);
    }
    
}

/*
    //trigger creation
trigger Acc_insert_update_Trigger on Account (After insert,After update) {
    
    AccountHistory_UpdateFields acchis = new AccountHistory_UpdateFields(); //AccountHistory_UpdateFields object creation
    
    //condition
    if(trigger.isInsert && trigger.isAfter){  
        acchis.isAfterInsert(Trigger.new); //call the method from class
    }

    //condition
    if(trigger.isUpdate && trigger.isAfter){  
        acchis.isAfterUpdate(Trigger.new); //call the method from class
    } */