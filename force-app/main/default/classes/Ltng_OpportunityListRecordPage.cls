public class Ltng_OpportunityListRecordPage {
    @AuraEnabled
    public static List<Opportunity> GetOpportunityDetails(){
        String UserId = UserInfo.GetUserId();
    	//Set<id> UsersAndSubordinates=RoleUtils.getUser(UserId);
    	List<Opportunity> OpportunityList = new List<Opportunity>();
    	
        OpportunityList = [select id,Name,OwnerId,IsPrivate,CloseDate,NextStep,AccountId,Account.Name,
                                StageName,Type,Probability,LeadSource,CampaignId,Amount,
                                OrderNumber__c,MainCompetitors__c,CreatedBy.Name,
                                CurrentGenerators__c,DeliveryInstallationStatus__c,TrackingNumber__c,
                                Description from Opportunity where Account.Name = 's'];
                            
        return OpportunityList;
    }
    
    @AuraEnabled
    public static InnerClassForOpportunity GetinnerOpportunityDetails(string ActionId){
        //Action__c ActionRec = new Action__c();
        List<Opportunity> OpportunityList = new List<Opportunity>();
        
        if(ActionId != null){
            //ActionRec=[Select Id,Name,Date__c,Status__C,Notes__C,Owner.name,Ownerid from Action__c];
            //system.debug('--ActionId---'+ActionId+'--ActionRec--'+ActionRec);
            OpportunityList=[select id,Name,OwnerId,IsPrivate,CloseDate,NextStep,AccountId,Account.Name,
                                StageName,Type,Probability,LeadSource,CampaignId,Amount,
                                OrderNumber__c,MainCompetitors__c,CreatedBy.Name,
                                CurrentGenerators__c,DeliveryInstallationStatus__c,TrackingNumber__c,
                                Description from Opportunity where Account.Name = 's'];
        }
        
        InnerClassForOpportunity Inn = new InnerClassForOpportunity();
        //Inn.ActionRecord = ActionRec;
        Inn.OpportunityList = OpportunityList;
        return Inn;
    }
    
    public class InnerClassForOpportunity{
        //@AuraEnabled public Action__c ActionRecord{get;set;}
        @AuraEnabled public List<Opportunity> OpportunityList{get;set;}
    }
}