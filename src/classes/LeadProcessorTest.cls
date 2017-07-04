@isTest
public class LeadProcessorTest {
    @isTest
    Static void LeadProcessor(){
        List<Lead> Llst = New List<Lead>();
        for(integer i = 1; i <= 200; i++){
            Llst.Add(new Lead(LastName='Testlead ' + i,Company='TestCompany',Status='Open - Not Contacted'));
        }
       	Upsert LLst;
		test.startTest();
		LeadProcessor LP = New LeadProcessor();
		ID BatchId = Database.executeBatch(LP);
		test.stopTest();
		List<Lead> L = [SELECT ID FROM LEAD WHERE LEADSOURCE = 'Dreamforce'];
		system.assertEquals(200, L.size());        
    }
}