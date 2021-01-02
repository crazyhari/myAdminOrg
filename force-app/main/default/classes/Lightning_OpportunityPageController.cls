public class Lightning_OpportunityPageController {
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
    public static  Opportunity editOppRec(string recordId){
        system.debug('recordId----->'+recordId);
        list<Opportunity> OppRef = [ SELECT Id, Name,OwnerId,IsPrivate,CloseDate,NextStep,AccountId,Account.Name,
                                StageName,Type,Probability,LeadSource,CampaignId,Amount,
                                OrderNumber__c,MainCompetitors__c,
                                CurrentGenerators__c,DeliveryInstallationStatus__c,TrackingNumber__c,
                                Description FROM Opportunity where id =: recordId limit 1];
        return OppRef[0];
    }
    
    @AuraEnabled 
    public static string saveOpportunity(Opportunity obj, string recordId){
       system.debug('opportunity Value--->'+obj +'recordId--->'+recordId);
        obj.AccountId = recordId;
        upsert obj;
       	return obj.Id;
    }
    
    @AuraEnabled 
    public static void savenewOpportunity(Opportunity newobj, string recordId){
        newobj.AccountId = recordId;
        upsert newobj;
    }
    
    @AuraEnabled
    public static user getUser(){
      User currentUser = [select id, Name, TimeZoneSidKey, Username FROM User Where id =: userInfo.getUserId()];
        return currentUser;
    }
    
}