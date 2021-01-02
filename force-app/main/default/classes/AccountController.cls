public class AccountController {
    
public List<Account> accountlist{get;set;}
public List<Account> queriedaccountlist{get;set;}
    
    public void AccountsList(){
        
        accountList = [select id,name from account];
        if(accountList.size()>0){
            queriedaccountlist=accountList;
            
            system.debug('accountList'+accountList);
        }
        
      
    }
    

}