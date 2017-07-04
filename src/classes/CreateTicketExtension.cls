public with sharing class CreateTicketExtension {
    private ApexPages.StandardController sc;
    Id ConcertId;
    Ticket__C Ticket;
    Concert__C Concert;
    public boolean NotSatisfied  {get; set;}
    public BookYourShowUsers__C UserDetails {get; set;}
    public double TotalTicketPrice { get; set;}
    public boolean IsCommentsEntered { set; get; }
    public boolean ShowNotSatisfied { set; get; }
    
    public CreateTicketExtension(ApexPages.StandardController controller) {
        sc = controller;
        this.Ticket = (Ticket__C)sc.getRecord();
        if(Ticket.Id == null ) {
            ConcertId = ApexPages.CurrentPage().GetParameters().Get('ConcertId');   
            this.Ticket.Concert__C =  ConcertId ; 
            this.Ticket.No_of_Tickets__c = 1; // restricted to book only 1 Ticket with this release
        } else {
            ConcertId = Ticket.Concert__C;
            // Flags to Control the User Comments field in TicketDetailPage
            IsCommentsEntered = false;
            if ( Ticket.Comments__C != null && Ticket.Comments__C != '' ) 
                IsCommentsEntered = true;               
            ShowNotSatisfied = Ticket.Is_Past_Event__c && !IsCommentsEntered;      
        }        
        setupUserDetails();            
    }  
    
    public Concert__c getConcert() {
        return getConcert(false);
    }
    public Concert__C getConcert(boolean ForceReload) {
        if (Concert == null || ForceReload) Concert = [SELECT Id, Name, Date_of_Concert__c ,No_of_Tickets_Available__c,
                                                       No_of_Premier_Tickets_Available__c,   No_of_Regular_Seats_Available__c, 
                                                       Premier_Tickets__c,RecordTypeId,Ticket_Price__c,Venue__c
                                                       FROM Concert__C where id =: ConcertId LIMIT 1];
        return Concert;        
    }
    private void setupUserDetails()
    {
        if (Ticket.BookYourShow_Users__c != null)
            UserDetails = [SELECT id, Customer_Email_Id__c,Full_Name__c FROM BookYourShowUsers__C where id = :Ticket.BookYourShow_Users__c];
    }
    
    public pagereference ProceedtoConfirm() {
        getConcert(true);
        if ( Ticket.No_of_Tickets__c > Concert.No_of_Regular_Seats_Available__C && Concert.RecordTypeId =='01228000000nTQOAA2') 
            return Page.CreateTicketPage2;           
        else 
            return toCreateTicketPage3();    
    }
    public void getTotalTicketPrice() {  
        getConcert(true);      
        if ( Ticket.No_of_Tickets__c < Concert.No_of_Regular_Seats_Available__C  )
            TotalTicketPrice = Concert.Ticket_Price__c * Ticket.No_of_Tickets__c; 
        else if ( Ticket.No_of_Tickets__c > Concert.No_of_Regular_Seats_Available__C && Concert.No_of_Regular_Seats_Available__C != 0)
            TotalTicketPrice = (Concert.Ticket_Price__c * Concert.No_of_Regular_Seats_Available__C) + (1.1 * Concert.Ticket_Price__c * ( Ticket.No_of_Tickets__c - Concert.No_of_Regular_Seats_Available__C));
        else
            TotalTicketPrice = 1.1 * Concert.Ticket_Price__c * Ticket.No_of_Tickets__c;        
    }
    public PageReference RefreshUserDetails()
    {
        setupUserDetails();  //on change to the lookup, set up the user record again
        return Apexpages.currentpage();
    }
    public PageReference ConfirmTicket() {
        Insert Ticket;  
        return toTicketDetailPage();       
    }
    public PageReference ContinueBooking() {
        return toCreateTicketPage3();
    }
    public PageReference CancelBooking() { 
        if (Ticket.BookYourShow_Users__c!=null) {
            pagereference UserTicketHistoryPage = New PageReference('/apex/UserTicketHistoryPage?Id='+Ticket.BookYourShow_Users__c);
            return UserTicketHistoryPage; 
        }
        else {
            pagereference ConcertPage = New PageReference('/'+Ticket.Concert__c);
            return ConcertPage;
        }
    }
    public PageReference InvokeCommentsBox() {
        return Apexpages.currentPage();
    }
    public PageReference SaveComments() { 
        upsert Ticket; 
        return toTicketDetailPage(); 
    }
    public pageReference toCreateTicketPage3() {
        getTotalTicketPrice();
        Ticket.Ticket_Price__c = TotalTicketPrice;
        // Ticket Status
        if ( Ticket.No_of_Tickets__c <= Concert.No_of_Tickets_Available__c) 
            Ticket.Status__c = 'Confirmed';
        else
            Ticket.Status__c = 'Wait List';
        return Page.CreateTicketPage3;
    } 
    public pagereference toTicketDetailPage() {
        pagereference TicketDetailPage = New PageReference('/apex/TicketDetailPage?id='+Ticket.ID);
        TicketDetailPage.setredirect(true);        
        return TicketDetailPage;     
    }      
    public PageReference toUserTicketHistoryPage() {
        pagereference UserTicketHistoryPage = New PageReference('/apex/UserTicketHistoryPage?Id='+Ticket.BookYourShow_Users__c);
        return UserTicketHistoryPage; 
    }
}