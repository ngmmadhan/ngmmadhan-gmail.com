public class ContactSearch {
	
    public static List<contact> searchForContacts(string LastName, string PostCode){
        return [Select Id,Name from Contact where LastName =:LastName and MailingPostalCode =:PostCode];
    }
}