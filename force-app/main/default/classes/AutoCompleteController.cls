public class AutoCompleteController {
 public user conList {get;set;}  

   public  AutoCompleteController(){
       // conList = new list<user>();
         conList = new user();
        //conList.add(c);
   }

    public void addContact() { 
        user c = new user();
        //conList.add(c);
    }

    public void removeContact(){
        Integer indexVal = Integer.valueof(system.currentpagereference().getparameters().get('index'));
       // conList.remove(indexVal - 1);   
    }

}