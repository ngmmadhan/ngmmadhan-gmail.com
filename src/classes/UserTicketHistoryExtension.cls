public with sharing class UserTicketHistoryExtension {
    
    public String BookYourShowUsers { get; set; }
    public List<Ticket__C> PastTicketList{get; set;}
    public List<Ticket__C> FutureTicketList{get; set;}
    
    public UserTicketHistoryExtension (ApexPages.StandardController controller) {
        id userid = ApexPages.currentPage().getParameters().get('id');
        date Todaydate = Date.Today();
        PastTicketList = [select id, Name, Concert__c, Ticket_Price__c,Status__C,Comments__C from Ticket__c where BookYourShow_Users__c =: userid AND Concert__c IN (Select ID from Concert__C where Date_of_Concert__c <: Todaydate)];
        FutureTicketList = [select id, Name, Concert__c, Ticket_Price__c,Status__C from Ticket__c where BookYourShow_Users__c =: userid AND Concert__c IN (Select ID from Concert__C where Date_of_Concert__c >=: Todaydate)];
    } 
}