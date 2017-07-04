public class AddPrimaryContact implements Queueable {
    private Contact C {get;set;}
    private String State {get;set;}
        
    public AddPrimaryContact(Contact Cont, String StateShort){
        this.C = Cont;
        this.State = StateShort;
    }
    
    public void execute(QueueableContext context){
        List<Contact> ContLst = New List<Contact>();
        List<Account> lstAccount = [SELECT ID,(SELECT accountId FROM CONTACTS) FROM ACCOUNT WHERE BillingState =: State LIMIT 200];
        for(Account AA : lstAccount){
            Contact Contact1 = c.clone(false,false,false,false);
            Contact1.AccountId = AA.Id;
			ContLst.Add(Contact1);
        }
        if(ContLst.size() >= 1) {
        	upsert ContLst;            
        }	
        System.debug('End of Execute');
    }
}