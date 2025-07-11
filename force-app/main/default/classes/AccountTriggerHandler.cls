public class AccountTriggerHandler {
public static void account( List <Account> accList){
for(Account acc : accList){
acc.Description = 'Account is Created';
        }
}
}