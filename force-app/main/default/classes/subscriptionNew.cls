public class subscriptionNew {
    public static void method(List<Subscription__c> a) {
        for(Subscription__c s : a){
            String numbers = s.No_Of_Periods__c;
            s.Subscription_Value__c = numbers;
        }
    }
}