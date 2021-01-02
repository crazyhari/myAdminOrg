public class Opp {

    public static void NewOpportunity(){
        
        Opportunity op = new Opportunity();
        op.Name = 'Sri';
        op.StageName = 'Qulification';
        op.CloseDate = Date.newInstance(2019,05,01);
        insert op;
    }

}