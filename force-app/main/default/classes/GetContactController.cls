public class GetContactController {
    @AuraEnabled
    public static List<Contact> getCon(){
        return [SELECT Id, Name, Email, Phone FROM Contact];
    }
}