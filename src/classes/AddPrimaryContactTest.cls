@isTEST	
public class AddPrimaryContactTest {

    @isTest Static Void AddPrimaryContactTest1(){
      List<Account> AcctLst = new List<Account>();
        for(integer i=1; i<=50; i++) {
            AcctLst.Add(New Account(Name='test' + I, BillingState='CA'));
            AcctLst.Add(New Account(Name='test' + I, BillingState='NY'));
        }
        Upsert Acctlst;
        
        Contact C = New Contact();
        C.lastName='test';
        Insert C;
        
        test.startTest();
		AddPrimaryContact APC = New AddPrimaryContact(C,'CA');
		id BatchId = system.enqueueJob(APC);
		test.stopTest();
        LIST<CONTACT> CL = [SELECT ID FROM CONTACT];
        system.assertEquals(51, CL.size());
    }
    
}