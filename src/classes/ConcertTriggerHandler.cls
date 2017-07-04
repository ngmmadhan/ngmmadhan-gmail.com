public with sharing class ConcertTriggerHandler {
    private boolean m_isExecuting = false;
    private integer BatchSize = 0;
    
    public ConcertTriggerHandler(boolean isExecuting, integer size){
        m_isExecuting = isExecuting;
        BatchSize = size;
    }
    
    public void OnBeforeInsert(List<Concert__C> newConcerts){
        list<string> lstConcertVenues = New list<string>();
        for(concert__c C : newConcerts) {
            lstConcertVenues.Add(C.Venue__c );
        }
        list<Concert__c> lstExistConcerts = [select id,Date_of_Concert__c,Venue__c from Concert__C where Venue__c IN : lstConcertVenues];
        for(Concert__c newConcert : newConcerts){
            for(Concert__c extConcert : lstExistConcerts ){
                if( newConcert.Venue__c == extConcert.Venue__c  && newConcert.Date_of_Concert__c == extConcert.Date_of_Concert__c) {
                    newConcert.addError('Venue ' + newConcert.Venue__c + ' is already reserved for the date ' + newConcert.Date_of_Concert__c.format() + '. Please try by changing the Date/venue');
                }
            }
        }
    }
}