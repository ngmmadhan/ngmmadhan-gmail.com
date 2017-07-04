public with sharing class MyContactListController {
    public MyContactListController() {
        // Constructor  
    }

    @AuraEnabled
    public static List<Contact> getContacts(){
        return [SELECT ID, Name, EMAIL, TITLE, PHONE FROM CONTACT];
    }
}