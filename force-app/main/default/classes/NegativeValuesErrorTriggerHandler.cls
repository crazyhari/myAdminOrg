public class NegativeValuesErrorTriggerHandler {
    public static void NegativeError(List<Opportunity> NewOppList){
        SObjectType OpportunityType = Schema.getGlobalDescribe().get('Opportunity');
        Map<String,Schema.SObjectField> fieldMap = OpportunityType.getDescribe().fields.getMap();
        
        Map<String,String> MapString = new Map<String,String>();
        
        for (String fieldName: fieldMap.keySet()) {
            Set<String> TypeSet;
            Schema.DisplayType fielddataType = fieldMap.get(fieldName).getDescribe().getType();
            String fieldLabel = fieldMap.get(fieldName).getDescribe().getLabel();
            System.debug('1---->'+fielddataType);
            System.debug('2---->'+fieldLabel);
            
            if(String.valueof(fielddataType) == 'CURRENCY' || String.valueof(fielddataType) == 'DOUBLE' || String.valueof(fielddataType) == 'INTEGER'){
                
                MapString.put(String.valueof(fieldName),String.valueof(fieldName));
            }
        }
        system.debug('--Number--'+MapString);
        
        for(Opportunity op: NewOppList){
            for (String fieldName: fieldMap.keySet()) {
                if(MapString.get(String.valueof(fieldName)) != null){
                    string FieldApiName = MapString.get(String.valueof(fieldName));
                    system.debug('--FieldApiName--'+FieldApiName);
                    system.debug('------field value-----'+Integer.valueof(op.get(FieldApiName)));
                    if(Integer.valueof(op.get(FieldApiName)) < 0){
                        op.addError('Negative value given..for '+FieldApiName);
                    }
                }
                
            }
        }
    }
}