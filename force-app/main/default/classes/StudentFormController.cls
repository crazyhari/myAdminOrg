public class StudentFormController {
    @AuraEnabled
    public static list<Student__c> GetStudentRecs(String StudentRecId){ 
        //system.debug('recordId-->'+actionRecId);
        List<Student__c> stdrec = [select Id,
                                   Name,
                                   Email__c,
                                   Phone__c,
                                   State__c,
                                   Gender__c,
                                   Date_Of_Birth__c,
                                   Address__c
                                   from Student__c];
        //system.debug('stdrec-->'+stdrec);
        
        return stdrec;
    }
    
    @AuraEnabled
    public static List < String > getselectOptions(sObject objectName, string fieldName) {
        system.debug('objObject --->' + objectName);
        system.debug('fld --->' + fieldName);
        List < String > allOpts = new list < String > ();
        // Get the object type of the SObject.
        Schema.sObjectType objType = objectName.getSObjectType();
        
        // Describe the SObject using its object type.
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
        
        // Get a map of fields for the SObject
        map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();
        
        // Get the list of picklist values for this field.
        list < Schema.PicklistEntry > values = fieldMap.get(fieldName).getDescribe().getPickListValues();
        
        // Add these values to the selectoption list.
        for (Schema.PicklistEntry a: values)
        {
            allOpts.add(a.getValue());
        }
        system.debug('allOpts ---->' + allOpts);
        allOpts.sort();
        return allOpts;
    }
    
    @AuraEnabled 
    public static string SaveStudent(Student__c std){
        system.debug('Student__c Value--->'+std);
        upsert std;
        return std.Id;
    }
    
    @AuraEnabled 
    public static void savenewstudent(Student__c newobj){
        upsert newobj;
    }
    
    @AuraEnabled
    public static list<Student__c> fetchStudentList(){
        return [select Id,
                Name,
                Email__c,
                Phone__c,
                State__c,
                Gender__c,
                Date_Of_Birth__c,
                Address__c
                from Student__c];             
    }
    
    @AuraEnabled
    public static Student__c EditStudentRec(string editstudentid){
        Student__c  studentrec = [select Id,
                                  Name,
                                  Email__c,
                                  Phone__c,
                                  State__c,
                                  Gender__c,
                                  Date_Of_Birth__c,
                                  Address__c
                                  from Student__c where id =: editstudentid];
        return studentrec;
    }
    
    @AuraEnabled
    public static string UpdateStudentRec(Student__c UpdateStdRec){
        update UpdateStdRec;
        return 'Successfully updated';
    }
    
    @AuraEnabled
    public static void deleteStudent(String StudentId){
        delete [select Id,
                		Name,
                        Email__c,
                        Phone__c,
                        State__c,
                        Gender__c,
                        Date_Of_Birth__c,
                        Address__c
                        from Student__c where id=:StudentId];
        
    }
}