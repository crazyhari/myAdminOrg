public with sharing class number_of_count_opp_records {
    public static void counttrigger(Opportunity [] opt){
        set<id> accidlist = new set<id>();
        for(Opportunity opp:opt){
            accidlist.add(opp.AccountId);
        }
        list<Account> acc = new list<Account>();
        Account[] aclist = [select id,Number_of_Opp_record_count__c,(select id from Opportunities)from Account where id IN:accidlist];
        for(Account ac: aclist){
            ac.Number_of_Opp_record_count__c = ac.Opportunities.size();
            acc.add(ac);
        }
        update acc;
   }
}