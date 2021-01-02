Public Class DisplayRelatedAttachements {
    public Boolean attachmentExists {get; set; }
    public Boolean contentPdf {get; set; }
    public Id attachmentId {get; set; }

    public DisplayRelatedAttachements(ApexPages.StandardController standardController) {
        Id accountId = system.currentPageReference().getparameters().get('id');
        List<Attachment> attachments = [SELECT Id, Name, ContentType, ParentId 
                                        FROM Attachment
                                        WHERE ParentId = :accountId];
        attachmentExists = false;
        contentPdf = false;
        //if(attachments.size() > 0) {
            attachmentExists = true;
            Attachment a = attachments[0];
            //if(a.ContentType != null && ((a.ContentType.toLowerCase().indexOf('pdf') > -1) || (a.Name.toLowerCase().endsWith('.pdf'))))
                contentPdf = true;
            attachmentId = a.Id;
        //}
    }
    /*public List<Attachment> AttachementList {get; set;}
    public string AccountId {get; set;}
    
    public DisplayRelatedAttachements(ApexPages.StandardController controller){
        //AccountId = (Account)controller.getRecord().id;
        AccountId = system.currentPageReference().getparameters().get('id');
        AttachementList= [SELECT Id, Name, ParentId, Parent.Type FROM Attachment where ParentId =: AccountId];
        system.debug('AttachementList' +AttachementList);
    }*/
}