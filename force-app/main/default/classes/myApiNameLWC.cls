public with sharing class myApiNameLWC {
    
    @AuraEnabled(cacheable=true)  
    public static List<InnerClass> getRetreieveObjects(string ObjectapiValue, string fieldapiValue){
        try{
            system.debug('ObjectapiValue' +ObjectapiValue);
            system.debug('fieldapiValue' +fieldapiValue);
            List<InnerClass> inclasslist = new List<InnerClass>();
            if(ObjectapiValue != '' && fieldapiValue != ''){        
                List<EntityDefinition> allObjects = new List<EntityDefinition>();
                //allObjects = [SELECT  QualifiedApiName FROM EntityDefinition where QualifiedApiName =: ObjectapiValue order by QualifiedApiName ];
                //where developerName!= null
                
                //for(EntityDefinition ED: allObjects){
                    String sObjectName = ObjectapiValue;  
                    System.debug('=========  '+ sObjectName);
                    List<Schema.SObjectField> sss=new list<Schema.SObjectField>();
                    
                    if(sObjectName != null && sObjectName != '' ){
                        Schema.SObjectType gd = Schema.getGlobalDescribe().get(sObjectName);
                        if(gd != null){
                            Schema.DescribeSobjectResult a11=gd.getDescribe();
                            Map<String, Schema.SObjectField> M = a11.fields.getMap();
                                if(M.get(fieldapiValue) != null){
                                    Schema.DescribeFieldResult f = M.get(fieldapiValue).getDescribe();
                                    system.debug('1' +f);
                                    system.debug('2' +f.getLabel());
                                    system.debug('3' +f.getInlineHelpText());
                                    system.debug('4' +sObjectName);
                                    InnerClass inclass = new InnerClass();
                                    inclass.FieldName = f.getName();
                                    inclass.FieldLabel = f.getLabel();
                                    //inclass.DataType = f.getType();
                                    //inclass.Description = f.getDescription();
                                    inclass.HelpText = f.getInlineHelpText();
                                    inclass.ObjectName = sObjectName;
                                    inclasslist.add(inclass);
                                }
                        // for(Schema.SObjectField s1:m.values()){
                        //     //system.debug('name' +s1.getDescribe().getName());
                        //     if(apiValue == s1.getDescribe().getName()){
                        //         Schema.DescribeFieldResult f = M.get(s1.getDescribe().getName()).getDescribe();
                        //         //system.debug('1' +f);
                        //     }
                        // }
                        }
                    }
                //}
                system.debug('inclasslist' +inclasslist);
                //return inclasslist;
            }
            else if(ObjectapiValue != '' && fieldapiValue == ''){
                SObjectType objToken = Schema.getGlobalDescribe().get(ObjectapiValue);
                DescribeSObjectResult objDef = objToken.getDescribe();
                Map<String, SObjectField> fields = objDef.fields.getMap(); 
                
                Set<String> fieldSet = fields.keySet();
                for(String s:fieldSet)
                {
                    SObjectField fieldToken = fields.get(s);
                    DescribeFieldResult selectedField = fieldToken.getDescribe();
                    System.debug('selectedField' + selectedField);
                    InnerClass inclass = new InnerClass();
                    inclass.FieldName = selectedField.getName();
                    inclass.FieldLabel = selectedField.getLabel();
                    inclass.ObjectName = ObjectapiValue;
                    inclass.HelpText = selectedField.getInlineHelpText();
                    inclasslist.add(inclass);
                }
            }
            return inclasslist;
        }catch(Exception e){
            List<InnerClass> inclasslist = new List<InnerClass>();
            return inclasslist;
        }
    }

    public class InnerClass{
        @AuraEnabled public string FieldLabel {get; set;}
        @AuraEnabled public string FieldName {get; set;}
        @AuraEnabled public string DataType {get; set;}
        @AuraEnabled public string Description {get;set;}
        @AuraEnabled public string HelpText {get; set;}
        @AuraEnabled public string ObjectName {get; set;}   
    }
}