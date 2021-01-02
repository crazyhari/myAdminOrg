public class EmailUpadate {
    public List<Contact> Contacts  {get;set;}
    public List<Account> Accounts  {get;set;}
    public Account acc             {get;set;}

    public EmailUpadate() {
        Contacts = new List<Contact>();
        acc = new Account();
    }
    public void callme(List<Contact> Contacts){
        for(Contact c : Contacts){
            if(c.Email != null && c.Mail_Active__c == true)
            acc.id = c.AccountId;
            acc.Email__c = c.Email;
            update acc;

        }
    }
}