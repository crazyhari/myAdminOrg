public class EmailMessageTriggerHandler {
	
    public static void GetEmailBody(List<EmailMessage> EmailList){
        for(EmailMessage eMsg : EmailList){
            system.debug(eMsg.HtmlBody+'-------------->'+eMsg);
            if(eMsg.HtmlBody != null && eMsg.HtmlBody != ''){
            	string Body = String.valueOf(eMsg.HtmlBody);
                if(Body != null && Body != ''){
                    if(Body.contains('<br clear="none" />')){
                        Body = Body.split('<br clear="none" />')[0];
                    }else if(Body.contains('<br><div class="gmail_quote">')){
                        Body = Body.split('<br><div class="gmail_quote">')[0];
                    }            
                }
                eMsg.HtmlBody = Body;
            }
        }
    }
}