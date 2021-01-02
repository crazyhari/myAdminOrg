public class Testingclass {
    public string aname         {set;get;}
    public string aphone        {set;get;}
    public string acity         {set;get;}
    public integer na           {set;get;}
    public integer n1           {set;get;}
    //public Account Ac         {get;set;}
    public list<Account> arecs  {set;get;}
    public list<Lead> lrecs     {set;get;}

    public void Testingclass(){
        arecs = new list<Account>();
    }
    public void mi(){
        integer na=[select count() from Account where name= :aname];
        
        if (na==0){
          Account Ac=new Account();
            Ac.name=aname;
            Ac.phone=aphone;
            Ac.Billingcity=acity;
            insert Ac;
            show(apexpages.Severity.CONFIRM,aname + 'Record Inserted');
        }
        else{
            show(apexpages.Severity.ERROR,aname + 'Record Exists' +na + 'Times');
        }      
    } 
    public void show(apexpages.Severity sev,string str ) {
        apexpages.Message msg =new apexpages.Message(sev,str);
        apexpages.addMessage(msg);
         arecs=[select id,name,createddate,phone,Billingcity from Account where name=:aname ];
        na = arecs.size();
        lrecs=[select id,name,createddate,phone,city,company from Lead where name=:aname ];
        n1= lrecs.size();
    }
}