public class Email_InActive_User_list_BatchClass implements database.batchable<SObject>{
    public database.querylocator start(database.batchableContext bc){
        return Database.getQueryLocator('select id,Name,Username,IsActive from User where IsActive = false');
    }
    public void execute(database.batchableContext bc, List<User> scope){
        //List<User> userlist =  new List<User>();
        //for(User u : scope){
            //user usr = (user)u;
            //userlist.add(usr);
        //}
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'chsri2904@gmail.com'};
        mail.setToAddresses(toAddresses);
        // mail.setToAddresses('chsri2904@gmail.com');
        mail.setSubject('InActive Users List');
        
        string htmlBody ='<h2>InActive Records</h2> <table border="1" width="100%" ><tr ><th>Name</th><th>UserName</th><th>Active</th></tr>';
        
        for(User ur : scope){
            htmlBody += '<tr><td>' + ur.Name + '</td><td>' + ur.Username + '</td><td>' + ur.IsActive + '</td></tr>';
        }
        htmlBody += '</table>';
        
        mail.setHtmlBody(htmlBody);
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
    
    public void finish(database.batchableContext bc){
        
    }

}