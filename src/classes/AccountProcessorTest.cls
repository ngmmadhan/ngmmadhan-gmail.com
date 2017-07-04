@isTest
public class AccountProcessorTest {

    @isTest Static Void AccountProcessorTest1(){
        Account A = new Account(Name='TestAccount');
       	insert A;
        
        Contact C = new Contact(FirstName='TestF',LastName='TestL',AccountId=A.id);
        insert C;
        Map<Id,Account> AcctMap = New Map<Id,Account>([Select Id FROM Account]);
        List<Id> AcctIdLst = New List<ID>();
        for(Account Acct : AcctMap.Values()){
            AcctIdLst.Add(Acct.ID);
        }
        Test.startTest();
        AccountProcessor.countContacts(AcctIdLst);
        Test.StopTest();
        List<Account> AcctLst2 = [Select Id, Number_of_Contacts__c FROM Account];  
        system.debug('AcctLst2' + AcctLst2);
        System.assertEquals(1, AcctLst2[0].Number_of_Contacts__c);
    }    
}