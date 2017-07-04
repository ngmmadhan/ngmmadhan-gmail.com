@isTest
class TestVerifyDate {

    @isTest
    static Void TestDate1(){
        Date Date1 = Date.newInstance( 2017, 4, 4 );
        Date Date2 = date1.addDays(5);
        Date Date3 = VerifyDate.CheckDates(Date1, Date2);
        System.assertEquals(Date2, Date3);
    }

    @isTest
    static Void TestDate2(){
        Date Date1 = Date.newInstance( 2017, 4, 4 );
        Date Date2 = date1.addDays(35);
        Date Date3 = VerifyDate.CheckDates(Date1, Date2);
        System.assertEquals(Date.newInstance( 2017, 4, 30),Date3);
    }
    @isTest
    static Void TestDate3(){
        Date Date1 = Date.newInstance( 2017, 4, 4 );
        Date Date2 = date1.addDays(-5);
        Date Date3 = VerifyDate.CheckDates(Date1, Date2);
        System.assertEquals(Date.newInstance( 2017, 4, 30),Date3);
    }
}