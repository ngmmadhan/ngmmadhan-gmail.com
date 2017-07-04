/** *****************************************************************************
 * BB_LTG_AccountOppTimelineCtrl_Test
 *
 * Description: 
 *
 * Test class for the apex controller for the account opportunities timeline 
 * lightning component
 *
 * Author kbowden
 * Date 17 Oct 2015
 *
 * Changes:
 ********************************************************************************/
@isTest 
private class BB_LTG_AcountOppTimelineCtrl_Test {
	@isTest 
    static void TestGetTimeline()
    {
        Account acc=new Account(Name='Test');
        insert acc;
        
        List<Opportunity> opps=new List<Opportunity>();
        
        Opportunity opp=new Opportunity(AccountId=acc.Id,
                                        Name='Test Opp 1',
                                       	CloseDate=System.today().addDays(-50),
                                        StageName='Closed Won',
                                        Amount=100000);
		opps.add(opp);
        
        opp=new Opportunity(AccountId=acc.Id,
                            Name='Test Opp 2',
                          	CloseDate=System.today().addDays(-75),
                            StageName='Closed Won',
                            Amount=200000);
		opps.add(opp);

        opp=new Opportunity(AccountId=acc.Id,
                            Name='Test Opp 3',
                          	CloseDate=System.today().addDays(-100),
                            StageName='Id Decision Makers',
                            Amount=150000);
		opps.add(opp);
        
        insert opps;
        
        Test.startTest();
        
        BB_LTG_Timeline timeline=BB_LTG_AccountOppTimelineCtrl.GetTimeline(acc.id);
        
        Test.stopTest();
        
        System.assertEquals(2, timeline.entries.size());
        System.assertEquals(System.today().addDays(-50), timeline.entries[0].theDate);
    }
}