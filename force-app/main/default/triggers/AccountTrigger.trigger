trigger AccountTrigger on Account (before update) {  
      if(Trigger.isUpdate){
        if(Trigger.isBefore){
        AccountTrigHandler.updateAccNumber(Trigger.oldMap, Trigger.new);
        }
      }
}