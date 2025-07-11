public class Items {
    public static void items(){
       String elec = 'Electronics';
       List<Item__c> item = [SELECT Name, Quantity__c, Catogery__c From Item__c
                            WHERE Catogery__c =: elec
                            ORDER BY Name ASC];
        for(Item__c i : item){
System.debug(i);
        }
    }
}