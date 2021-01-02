trigger EmailMessageTrigger on EmailMessage (before insert) {
	
    EmailMessageTriggerHandler handler = new EmailMessageTriggerHandler();
    EmailMessageTriggerHandler.GetEmailBody(Trigger.New);
}