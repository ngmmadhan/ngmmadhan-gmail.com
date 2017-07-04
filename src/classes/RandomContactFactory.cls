public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer NoOfContacts, String strlastName) {
        List<Contact> Clst = New List<Contact>();
        for(integer i=0; i < NoOfContacts; i++) {
            Contact C = New Contact(FirstName='Test ' + i,LastName=strlastName);
            Clst.Add(C);
        }
        return Clst;
    }
}