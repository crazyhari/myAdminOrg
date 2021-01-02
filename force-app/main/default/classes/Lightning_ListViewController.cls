public class Lightning_ListViewController {    
    @AuraEnabled
    public List<string> getObjectOptions(){
   List<string> options = new List<string>();
   Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();

    for(Schema.SObjectType thisObj : gd.values()) {
        options.add(string.valueof(thisObj));
    }

   return options;
}
  /*  public static list<String> fetchListViews(String strObjName) {
        list<String> lstListViews = new list<String>();
        if(strObjName != null && strObjName !=  ' ' && strObjName.length() != 0) {            
            list<ListView> lstViews = [Select Name,sobjectType From ListView where SobjectType =: strObjName];
            for(ListView iterator:lstViews) {
                lstListViews.add(iterator.Name);
            }
        }   
        return lstListViews;
    } */
}