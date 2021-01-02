public class AccountTriggerHandler {
    
    public void insertAndUpdateAccounts(list<account> AccountList){
        list<Account_History__c> accountHistoryList = [select id
                                                       , Name
                                                       , Type__c
                                                       , Account__c from Account_History__c 
                                                       where Account__c IN : AccountList];
        Map<id,id> accountMap =new  Map<id,id>();
        for(Account_History__c acchistory: accountHistoryList){
            accountMap.put(acchistory.Account__c,acchistory.id);
        }
        list<Account_History__c>newlist = new list<Account_History__c>();
        for (Account acc : AccountList){
            
            Account_History__c acchistory = new Account_History__c();
            if(accountMap.get(acc.Id) != null){
                acchistory.id = accountMap.get(acc.Id);
                acchistory.Name = acc.Name;
                acchistory.Type__c = acc.Type;
                acchistory.Account__c = acc.Id;
            }
            else{
                acchistory.Name = acc.Name;
                acchistory.Type__c = acc.Type;
                acchistory.Account__c = acc.Id;
            }
            newlist.add(acchistory);
        }
        upsert newlist;
    }


}

/*//class creation for trigger
public class AccountHistory_UpdateFields {
    
    //variable declartion
    public static List<Account> aRecs        {get;set;}
    public static List<Account_History__c> ahRecs  {get;set;} 
    public static List<Account_History__c> newlist  {get;set;}
    public static Account_History__c acchistory   {get;set;}
    public static Account acc            {get;set;}
        
    //Constructor
    public AccountHistory_UpdateFields(){
        aRecs = new List<Account>();
        ahRecs = new List<Account_History__c>();
        newlist = new List<Account_History__c>();
        acc = new Account();
    }
    
    //method creation
    public void isAfterInsert(List<Account> aRecs){
        //logic
        ahRecs = new List<Account_History__c>();
        for(Account acc: aRecs){
            acchistory = new Account_History__c();
            acchistory.Name = acc.Name;
            acchistory.Type__c = acc.Type;
            acchistory.Account__c = acc.Id;
            ahRecs.add(acchistory);
        }
        insert ahRecs; //inserting a data (DML) operation
    }
    
    //method creation
    public void isAfterUpdate(List<Account> aRecs){
        
    ahRecs = [select id, Name, type__c, Account__c from Account_History__c where Account__c IN : aRecs]; //fetch the data from account history records
     
    Map<id,id> mapAcc =new  Map<id,id>(); //Map creation with id's
     
    for(Account_History__c acchistory: ahRecs){
    
      mapAcc.put(acchistory.Account__c,acchistory.id); //This will add element to the map
    }
     for (Account acc : aRecs){
     
            acchistory = new Account_History__c();
      acchistory.id = mapAcc.get(acc.Id);
            acchistory.Name = acc.Name;
            acchistory.Type__c = acc.Type;
            acchistory.Account__c = acc.Id;
            newlist.add(acchistory);
        }
        update newlist; //updating a data (DML) operation
    }
  
}*/