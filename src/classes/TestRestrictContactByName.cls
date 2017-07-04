@isTest
class TestRestrictContactByName {

    @isTest Static void TestRestrictContactByName1(){
        Contact C = New Contact(FirstName='TestContact',LastName='INVALIDNAME');
        test.startTest();
        Database.SaveResult result = Database.insert(c,false);
        test.stopTest();
        system.assert(!Result.isSuccess());
        system.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',Result.getErrors()[0].getmessage());
    }
}