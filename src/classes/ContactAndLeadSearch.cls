public class ContactAndLeadSearch {

    public static List<List< SObject>> searchContactsAndLeads(string SearchString) {
        
        return [FIND :SearchString IN ALL FIELDS RETURNING LEAD(NAME),Contact(Name, Phone)];
    }
    
}