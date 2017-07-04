public class AccountProcessor {
	@future
    public static void countContacts(List<id> AccountIds){
        List<Account> Alst = New List<Account>();
        for(Account Acct : [SELECT ID, Number_of_Contacts__c,(SELECT ID FROM CONTACTS) FROM ACCOUNT WHERE ID IN : AccountIds]){
			Acct.Number_of_Contacts__c = Acct.Contacts.Size();
            Alst.Add(Acct);
            system.debug('Acct' + Acct);
        }
        Upsert Alst;
    }
    
}