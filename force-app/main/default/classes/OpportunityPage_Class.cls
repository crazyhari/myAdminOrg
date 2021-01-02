public class OpportunityPage_Class {
    public Opportunity opp  	{get;set;}
    public string OpportunityID {get;set;}
    
    public OpportunityPage_Class(ApexPages.StandardController stdcontrol){
        opp = new Opportunity ();
        opp.OwnerId = UserInfo.getUserId();
        
        OpportunityID = ApexPages.currentPage().getParameters().get('id');
        if(OpportunityID!= null){
            Opportunity opty = [select id,Name,OwnerId,IsPrivate,CloseDate,NextStep,AccountId,
                                StageName,Type,Probability,LeadSource,CampaignId,Amount,
                                OrderNumber__c,MainCompetitors__c,
                                CurrentGenerators__c,DeliveryInstallationStatus__c,TrackingNumber__c,
                                Description from Opportunity where id =:OpportunityID];
            
            opp = opty;
        }
    }
    
    public PageReference save(){
        
        if(OpportunityID != null){
            update opp;
        }
        else{
        	insert opp;
        }
        
        PageReference pageRef = new PageReference('/'+ opp.id);
        return pageRef;
    }
    
    public void saveNew() {
        
        if(OpportunityID != null){
            update opp;
            opp.clear();
        }
        else{
        	insert opp;
            opp.clear();
        }
    }
}