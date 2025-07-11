trigger AccountFir on Account (before insert) {
if(Trigger.isInsert){
    if(Trigger.isBefore){
        AccountTriggerHandler.account(Trigger.New);
    }
}
}