public class Employee_Task {
    public Employee__c emp  {set;get;}
    public List<Employee__c> eRecs{set;get;}
    public string EmployeeID{get;set;}
    
    public Employee_Task(ApexPages.StandardController stdcontrol) {
        emp = new Employee__c ();
        EmployeeID = ApexPages.currentPage().getParameters().get('id');
        if(EmployeeID!= null){
            Employee__c Employee = [select id, Name,email__c,company__c,Phone__c,Joining_Date__c, Experience__c,Salary__c,Address__c,City__c,State__c from Employee__c where id =:EmployeeID];
            
            emp = Employee;
        }
    }
        
        public PageReference save(){
            if(EmployeeID != null){
                
                update emp;
            }
            else{
                 insert emp;
                
            }
            PageReference pageRef = new PageReference('/'+ emp.id);
                return pageRef;
               
        }
        
        
        public void search(){
            eRecs = new List<Employee__c>();
            eRecs = [select Address__c, City__c, Company__c, Email__c, Name, Experience__c, Joining_Date__c, Phone__c, Salary__c, State__c from Employee__c where  Name =: emp.Name ];
            
            
        }
        
      public void edit(){
             
      eRecs = [select Address__c, City__c, Company__c, Email__c, Name, Experience__c, Joining_Date__c, Phone__c, Salary__c, State__c from Employee__c where  id =: emp.id ];
      insert eRecs;
       
       
     }
     
}