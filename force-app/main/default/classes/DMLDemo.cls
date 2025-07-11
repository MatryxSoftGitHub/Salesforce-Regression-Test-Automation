public class DMLDemo {
public static void insertDemo(){
List <Account> accList = new List <Account>();
    List <Contact> conList = new List <Contact>();
    
    Account acc = new Account();
    acc.Name = 'DML test 201';
    accList.add(acc);
     
    Account acc1 = new Account();
    acc1.Name = 'DML test 202';
    accList.add(acc1);
    
        insert accList;
    
    Contact con = new Contact();
    con.FirstName = acc.Name;
    con.LastName = acc.Name;
    con.AccountId = accList[0].Id;
    conList.add(con);
    
    Contact con1 = new Contact();
    con1.FirstName = acc1.Name;
    con1.LastName = acc1.Name;
    con1.AccountId = accList[1].Id;
    conList.add(con1);
   
    insert conList;
    
}
}