public class ForLoopExample {
    public static void example(){
        List <Account> acc = new List <Account>();
        acc = [Select ID, Name FROM Account Limit 5];
        
        Set <ID> ids = new Set <ID>();
        
        
        if(acc.size()>0){
            for(Account acc1 : acc){
                System.debug(acc1.ID +' - ' + acc1.Name);
                ids.add(acc1.ID);
            }
            
            if(!ids.isEmpty()){
                for(Id ids1 : ids)
                {
                    System.debug('ID is ' + ids1); 
                    
                }
                
            }
        }
    }
}