public with sharing class AccountPagination 
{
 @AuraEnabled
    public static List<Account> getAccounts()
    {
        return [SELECT Id, Name FROM Account];
    }
}