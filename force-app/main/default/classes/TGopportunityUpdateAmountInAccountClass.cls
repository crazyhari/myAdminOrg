public class TGopportunityUpdateAmountInAccountClass {
    public static void totalOppAmounts(list<opportunity> lstOfopps){
        system.debug('==lstOfopps== : '+lstOfopps);
        set<id> accIds = new set<id>();
        list<account> updLstOfAccs = new list<account>();
        list<opportunity> lstCons = new list<opportunity>();
        double totalAmount = 0;
        for(opportunity opp : lstOfopps){
            accIds.add(opp.accountid);
        }
        system.debug('==accIds==:'+accIds);
        list<account> lstAccs = [select id,name,Total_Opp_Amount__c, (select id,amount from opportunities) from account where id in : accIds];
         
        for(account acc : lstAccs){
            for(opportunity op : acc.opportunities){
                if(op.amount != null)
                totalAmount = totalAmount + op.amount;
                 
            }
            acc.Total_Opp_Amount__c =  totalAmount; 
            updLstOfAccs.add(acc);
        }
        if(updLstOfAccs.size() > 0){
            update updLstOfAccs;
        }
         
         
    } 
}