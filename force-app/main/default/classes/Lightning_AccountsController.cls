public class Lightning_AccountsController {
    @AuraEnabled
      public static List <Account> getAccounts() {
        return [SELECT Id, name, industry, Type, NumberOfEmployees, Phone FROM Account ORDER BY createdDate ASC];
      }
}