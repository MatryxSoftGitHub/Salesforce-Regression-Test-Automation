public class SOQLDemo {
public static void queryDemo(){
    List <Account> acc = [SELECT Name, Industry, Type
                          FROM ACCOUNT
                         WHERE Industry = 'Energy' OR Type = 'Customer - Direct'];
    for(Account acct : acc){
        System.debug(acct);
}
}
}