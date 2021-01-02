public class Lightning_PageBlockTable {
    @Auraenabled
    public static List<Account> getAccounts(){
        System.debug('In controller getAccounts method..');
        return [Select ID,Name,Phone,Website,NumberOfEmployees from Account ORDER BY CREATEDDATE DESC];
    }
    
    @Auraenabled
    public static List<Account> delteAccountById(String accid){
        System.debug('In controller delteAccountById method..');
        Account delAccount=[Select Id from Account where id=:accid];
        delete delAccount;
        return [Select ID,Name,Phone,Website,NumberOfEmployees from Account ORDER BY CREATEDDATE DESC];
    }
}