@isTest
public class DailyLeadProcessorTest {

    @isTest
    static void TestMethod1(){
       List<Lead> Llst = New List<Lead>();
        for(integer i=1;i<=10;i++){
        	Llst.add(New Lead(lastName='test' + i,Company='TestCompany',Status='Open - Not Contacted'));
        }
        Upsert Llst;
        
        Llst = [SELECT ID FROM LEAD];
        Test.startTest();
        string Jobid = System.Schedule('UpdateLeadSource','0 0 0 15 04 ? 2022',new DailyLeadProcessor());
        Test.stopTest();
        Llst = [SELECT ID FROM LEAD WHERE LEADSOURCE='Dreamforce'];
        System.assertEquals(10, Llst.size());
    }
}