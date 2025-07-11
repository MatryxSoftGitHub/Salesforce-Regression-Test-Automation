public class AccountTrigHandler {
public static void updateAccNumber(Map <Id, Account> accMap, List <Account> accList){
    for(Account acc : accList){
        if(accMap != null && acc.Industry != accMap.get(acc.Id).Industry && acc.isAvailable__c == true){
acc.BillingCity = 'Bengaluru';
        }
        else{
        acc.BillingCity = 'Pune';
        }
    }
} 
}