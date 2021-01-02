@isTest
public class EnrollTriggerHandler_Tc {
    public static testmethod void Enr_Trigger_Handler(){
        List<Enrollment__c> e = new List<Enrollment__c>();
        Enrollment__c enr = new Enrollment__c();
        enr.Enrollment_Contact__c = 'sri';
        enr.StartDate__c = date.newInstance(2015, 12, 15);
        enr.EndDate__c = Date.parse('12/15/15');
        e.add(enr);
        Test.startTest();
        insert e;
        update e;
        Test.stopTest();
    }

}