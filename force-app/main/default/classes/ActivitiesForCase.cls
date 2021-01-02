public class ActivitiesForCase {
    
    public string ActivityString{get;set;}
    public string CaseId{get;set;}
    public List<InnerClass> InnerClassList{get;set;}
    
    public void GetActivities(){
        CaseId = apexpages.currentpage().getparameters().get('Id');
        InnerClassList = GetActivityStringForVfPage(CaseId);
        
    }
    
    @AuraEnabled
    public static List<InnerClass> GetActivity(string CaseId){
        List<InnerClass> InnerClassList = GetActivityStringForVfPage(CaseId);
        return InnerClassList;
    }
    
    public static List<InnerClass> GetActivityStringForVfPage(string CaseId){
        List<InnerClass> Data = new List<InnerClass>();
        List<Case> CaseList = [select Id,SuppliedEmail, (select id,TextBody,FromAddress from EmailMessages order by createddate desc) from Case where Id=:CaseId];
        string str='';
        for(Case qt:CaseList){
            for(EmailMessage ActHis: qt.EmailMessages){
                InnerClass Inn = new InnerClass();
                string Body = String.valueOf(ActHis.TextBody);
                
                if(Body.contains('\nOn')){
                    Body = Body.split('\nOn')[0];
                }
                if(Body.contains('\n---')){
                    Body = Body.split('\n---')[0];
                }
                
                string FromEmail = String.valueOf(ActHis.FromAddress);
                Inn.TextBody = Body;
                Inn.CaseWebEmail = qt.SuppliedEmail;
                Inn.FromEmail = FromEmail;
                Data.Add(Inn);
            }
        }
        System.debug(CaseList+'--List size--'+CaseList.size()+'--Data--'+Data.size());
        return Data;
    }
    
    public class InnerClass{
        @AuraEnabled
        public string TextBody{get;set;}
        @AuraEnabled
        public string CaseWebEmail{get;set;}
        @AuraEnabled
        public string FromEmail{get;set;}
    }
    
}