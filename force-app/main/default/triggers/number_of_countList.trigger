trigger number_of_countList on Opportunity (after insert, after update, after delete) {
    
    if(trigger.isafter && (trigger.isinsert || trigger.isupdate)){
        number_of_count_opp_records.counttrigger(trigger.new);
    }
    
    if(trigger.isafter && trigger.isdelete){
        number_of_count_opp_records.counttrigger(trigger.old);
    }
}