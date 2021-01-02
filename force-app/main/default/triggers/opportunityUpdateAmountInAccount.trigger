trigger opportunityUpdateAmountInAccount on Opportunity (after insert, after update) {
    if (trigger.isAfter && (trigger.isInsert || trigger.isUpdate)) {
        TGopportunityUpdateAmountInAccountClass.totalOppAmounts(trigger.new);
    }
    else if (trigger.isAfter && trigger.isDelete) {
        TGopportunityUpdateAmountInAccountClass.totalOppAmounts(trigger.old);
    }



    /*map<id,list<opportunity>> accidopplistmap  = new map<id,list<opportunity>>();
    set<id> accids = new set<id>();
    list<opportunity> opplist = new list<opportunity>();
    if(trigger.isinsert || trigger.isupdate){
        for(opportunity opp : trigger.new){
            if(opp.accountid != null){
                accids.add(opp.accountid);
            }
        }
    }
    if(trigger.isdelete){
        for(opportunity opp : trigger.old){
            if(opp.accountid != null){
                accids.add(opp.accountid);
            }
        }
    }
    if(accids.size()>0){
        opplist = [select amount,Accountid from opportunity where Accountid in : accids];
        for(opportunity op : opplist){
            if(op.amount != null){
                if(!accidopplistmap.containskey(op.accountid)){
                    accidopplistmap.put((op.accountid),new list<opportunity>());
                }
            }
               accidopplistmap.get(op.accountid).add(op);
        }
        list<account> acclist = new list<account>();
        acclist = [select Total_Opp_Amount__c from account where id in :accids];
        for(account acc: acclist){
            list<opportunity> templist = new list<opportunity>();
            templist = accidopplistmap.get(acc.id);
            Double totalopamount = 0;
            for(opportunity o: templist){
                if(o.Amount!= null){
                    totalopamount += o.Amount;
                }
            }
            acc.Total_Opp_Amount__c = totalopamount;
        }
        update acclist;
    } */
}