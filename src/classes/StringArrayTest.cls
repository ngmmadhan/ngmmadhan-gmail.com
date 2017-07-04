public class StringArrayTest {
  public static list<string> generateStringArray(integer TestNumber){
    list<string> TestList = new list<string>();
    for(integer i=0; i<TestNumber; i++)
    {
       TestList.add('Test ' + i);
    }
    return TestList;
  }
    public static string getaccountdetail(){
        // Get Name directly from Query
        String acctstr = [SELECT ID,Name FROM Account where id = '0012800000usoKL'].Name;
        System.debug('Account Name' + acctstr);
        
        // List Account
        List<Account> Accts = [SELECT ID,NAME FROM ACCOUNT LIMIT 10];
        
        // Set Account
        Set<Account> SetAccts = New Set<Account>();
        for(Account AccounItem: Accts) {
            SetAccts.add(AccounItem);
        	System.debug('Account String ' + JSON.serialize(AccounItem));
        }
        for(Account AccounItem: SetAccts) {
        	System.debug('Account String from Set' + JSON.serialize(AccounItem));
        }
        
        // Map Account
        Map<Id, Account> AccountMap = New Map<Id, Account>([SELECT ID,Name FROM Account ACCOUNT LIMIT 10]);
        for(Account AccountMapItem: AccountMap.values()) {
        	System.debug('Account String from Map' + JSON.serialize(AccountMapItem));
        }
        
        // Generic Object
        sObject GO = [SELECT ID,Name FROM Account where id = '0012800000usoKL'];
        Account acct = (Account)GO;
        // Serialize
        string JSONFormatStr = JSON.serialize(acct);
        // DeSerialize
        Account Acct2 = (Account)JSON.deserialize(JSONFormatStr, Account.class);
        system.debug('Test Debug');
        return JSON.serialize(Acct2);
    }
    public static void DMLOperations(){
        List<Contact> lstCont = new List<Contact>{ new Contact(FirstName='John',LastName='Smith',Department='Finance'),
            									   new Contact(FirstName='Martin',LastName='Sedegewick',Department='IT'),
            									   new Contact(FirstName='Ben',LastName='Silkerk',Department='Admin')
            									 };
       upsert lstCont;
       
        List<Contact> lstContUpdated = New List<Contact>();
        for(Contact cont : lstCont ) {
            if(cont.Department == 'IT') {
                cont.Title = 'Developer';
                lstContUpdated.Add(cont);
            }
        }       
        Upsert lstContUpdated;
    }
}