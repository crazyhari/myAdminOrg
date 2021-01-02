public class EnrollTriggerHandler{
    public static List<Enrollment__c> eRecs  {get;set;}
    public static List<Contact> cRecs        {get;set;}
    public static Contact con                {get;set;}
    
    
    public EnrollTriggerHandler(){
        eRecs = new List<Enrollment__c>();
    }
    
    public static void afterInsert(){
        for(Enrollment__c e :[select id, Name, StartDate__c, EndDate__c, Training__c, Enrollment_Contact__c from Enrollment__c]){
            
            cRecs = new List<Contact>();
            con = new Contact();
            con.Id = e.Enrollment_Contact__c;
            con.Enroll_StartDate__c = e.StartDate__c;
            con.Enroll_EndDate__c = e.EndDate__c;
            cRecs.add(con);
            update cRecs;
            //System.debug(cRecs);
        }
    }
}