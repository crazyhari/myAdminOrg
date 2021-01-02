trigger RelatedAccountPicklist on Contact (before insert) {
    //Populate a collection of all account the inserted contact are related to
    Set<Id> AccountIds = new Set<Id>();
    for (Contact con : Trigger.new) {
		AccountIds.add(con.OwnerId);
	}
	
	//Query all accounts from the collection, and map them by ID for easy access
	Map<Id, Account> mapAccounts = new Map<Id, Account>([SELECT Id,Name, Active__c FROM Account WHERE Id IN :AccountIds]);
	
	for (Contact con : Trigger.new) {
		Account acc = mapAccounts.get(con.OwnerId);
        if(acc.Active__c == 'Yes'){
           insert con;
        }
	}
}