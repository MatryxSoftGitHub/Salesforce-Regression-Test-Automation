trigger myTrig on Lead (before update, after update) {

    if(Trigger.isUpdate){

          if(Trigger.isBefore){
    System.debug('Trigger updated before Update');
    }
          if(Trigger.isAfter){
    System.debug('Trigger updated after Update');
    }
    }
    
    
}