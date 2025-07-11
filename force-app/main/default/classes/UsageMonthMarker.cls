public class UsageMonthMarker implements Schedulable {
  public void execute(SchedulableContext sc) {
    Date today = Date.today();
    List<Usage__c> usageList = [
      SELECT Id, Usage_Month_Start__c, Usage_Month_End__c
      FROM Usage__c
    ];
    
    for (Usage__c usage : usageList) {
      usage.Current_Month__c = 
        usage.Usage_Month_Start__c <= today && usage.Usage_Month_End__c >= today;
    }
    update usageList;
  }
}