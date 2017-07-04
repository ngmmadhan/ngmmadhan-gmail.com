public class AccountHandler {
    
    public static account insertNewAccount(string AccountName){
        Account Acct = new Account();
        Acct.Name = AccountName;
        try {
            insert Acct;
            return Acct;
        } catch (DmlException e) {
            system.debug('Exception Message' + e.getmessage());
            return null;
        }
    }
}