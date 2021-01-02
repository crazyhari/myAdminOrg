import { LightningElement,track } from 'lwc';
import getRetreieveObjects from "@salesforce/apex/myApiNameLWC.getRetreieveObjects";
// import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ApiNameDetails extends LightningElement {
    @track searchObjAPIName = '';
    @track searchFieldAPIName = '';
    @track listofdetails;
    @track areDetailsVisible = false;
    
    // showErrorToast() {
    //     const evt = new ShowToastEvent({
    //         title: 'Toast Error',
    //         message: 'Some unexpected error',
    //         variant: 'error',
    //         mode: 'dismissable'
    //     });
    //     this.dispatchEvent(evt);
    // }
    // showSuccessToast() {
    //     const evt = new ShowToastEvent({
    //         title: 'Toast Success',
    //         message: 'Opearion sucessful',
    //         variant: 'success',
    //         mode: 'dismissable'
    //     });
    //     this.dispatchEvent(evt);
    // }

    onchangeObjSearch(event) {
        //alert('evnt' +event.target.value);
        this.searchObjAPIName = event.target.value;
    }
    onchangeFieldSearch(event) {
        this.searchFieldAPIName = event.target.value;
    }

    handleSubmit(event){
        //return this.listofdetails;
        //alert('11' +this.searchAPIName);
        getRetreieveObjects({
            ObjectapiValue: this.searchObjAPIName,
            fieldapiValue: this.searchFieldAPIName
          })
          .then((result) => {
            //alert('result1' +result);
            if (result) {
                this.listofdetails = result
                if(result.length >0){
                    this.areDetailsVisible = true
                }else{
                    this.areDetailsVisible = false
                }                
                //alert('result2' +JSON.stringify(result));
            }
        })
    }    
}