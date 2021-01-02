public class OnlineShoppingtask_class {
    public String message     {get;set;}
    public decimal totalcost  {get;set;}
    List<DisplayProduct> products;
    Map<Id, DisplayProduct> cart;
    public Boolean incart    {get;set;}
    public Id rowz;
    public id rowDel      {get;set;}
    public OrderItem oditm    {get;set;}
    
    public class DisplayProduct {
        public Product2 product  {get;set;}
        public Decimal count  {get;set;}
        public Decimal tempCount{get;set;}
        public DisplayProduct(Product2 item){
            this.product = item;
        }
    }
    
    public List<DisplayProduct> getProducts() {
        if (products == null){
            products = new List<DisplayProduct>();    
            for(Product2 item :[SELECT id, Name,Price__c FROM Product2 where Family='sri']) {
              products.add(new DisplayProduct(item));
            }
        }
        return products;
    }
    
    public PageReference shop(){        
        handleTheBasket();        
        message = 'You bought: ';
        for (DisplayProduct p:products){
            if(p.tempCount > 0){
                message += p.product.name + ' (' + p.tempCount + ') ' ;
            }
        }
        return null;
    }
    
    public void handleTheBasket(){
        for(DisplayProduct c : products){           
            if(c.tempCount > 0){
                if(cart.containsKey(c.product.Id)){
                    cart.get(c.product.Id).count = c.tempCount;            
                }
                else{
                    cart.put(c.product.Id, c);
                    cart.get(c.product.Id).count = c.tempCount;
                    incart = true;
                    System.debug(incart);
                }
            }
        }
    }
    
    public Map<Id, DisplayProduct> getCart() {
        if(cart == null){
            cart = new Map<Id, DisplayProduct>();
            incart = false;
        }
        return cart;
    }
    
    public void remove(){
        rowz = (Id) ApexPages.currentPage().getParameters().get('rowDel');
        system.debug(rowz);
        if(cart.containsKey(rowz)){
            cart.remove(rowz);
            if(cart.isEmpty()){
                incart = false;
                system.debug(incart);
            }
        }
    }
    
    public Pagereference checkout(){
        if(cart.isEmpty()){
            ApexPages.Message myError = new ApexPages.Message(ApexPages.Severity.ERROR, 'Shopping Cart is Empty');
            ApexPages.addMessage(myError);
            System.debug('on');
            return null;
        }
        else{
        PageReference send = new PageReference('');
        return send;
        }
    }
    
    public PageReference save() {
        for (DisplayProduct p:products){  
            if(p.tempCount > 0){
                oditm = new OrderItem ();
                oditm.Product2Id = p.product.Id;
                oditm.UnitPrice = p.product.Price__c;
                //oditm.TotalPrice = ((p.product.Price__c) * (p.tempCount));
                insert oditm;
            }
        }
        return null;
    }
    
    public PageReference Cancel(){
        return null;
    }
    
    public pageReference back(){
        PageReference doit = new PageReference('/apex/Mycart');
        doit.setRedirect(false);
        
        return doit;
    }
    public void confirm(){
        for(Id d:cart.keySet()){
      }
    }
}