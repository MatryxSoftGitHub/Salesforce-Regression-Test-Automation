public class ContactAndLeadSearch {
    public static List<List< sObject>> searchContactsAndLeads(String str){
        List<List< sObject>> obj = [FIND : str IN ALL FIELDS 
                                   RETURNING Contact(FirstName, LastName), Lead(FirstName, LastName)];
        return obj;
    }
}