@isTest
private class AccountControllerTest {
    
    private static testMethod void testAccountList(){
        
        Account a =new Account();
        a.name='test';
        insert a;
        AccountController ac = new AccountController();
        ac.AccountsList();
      
        
        
    }

}