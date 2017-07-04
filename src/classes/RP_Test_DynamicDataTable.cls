@isTest
private class RP_Test_DynamicDataTable 
{
    private static testMethod void createDate()
    {
        Account objAccount = new Account(Name = 'Test Account  -  1');
        insert objAccount;
        Account objAccount2 = new Account(Name = 'Test Account  -  2');
        insert objAccount2;
        RP_Dynamic_Table.fetchRecords('SELECT Id, Name FROM Account');
    }
}