public class DMLDemo1 {
    public static void insertDemo(){
List<Account> accList1 = new List<Account>();
        for(Integer i = 1; i<=158; i++){
            Account acc = New Account();
            acc.Name = 'Test DML '+ i;
            accList1.add(acc);
           
        }
         insert accList1;
    }
    
    public static void updateDemo(){
        List <Account> accList2 =new list <Account>();
        accList2 = [SELECT ID, Name, Industry FROM Account
                   WHERE Rating = 'Hot'];
        if(!accList2.isEmpty()){
            for(Account acc3 : accList2){
acc3.Industry = 'Media';
                acc3.Active__c = 'Yes';
            }
            Update accList2;
        }
        System.debug(accList2);
    }
}