@isTest
public class AccountTriggerHandler_Testclass {
    
    public static testmethod void AccHis_updateFields(){
        //AccountTriggerHandler acchis = new AccountTriggerHandler();
        List<account> a = new List<account>();
        Account ac = new Account(Name = 'dilip', Type ='Installation Partner');
        a.add(ac);
         Test.startTest();
        insert a;
        update a;
        Test.stopTest();
       // acchis.isAfterInsert(a);
       //acchis.isAfterupdate(a);
     }

}