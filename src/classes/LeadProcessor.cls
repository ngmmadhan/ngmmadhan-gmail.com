global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful{

    global Integer recordsProcessed = 0;
    
    global Database.QueryLocator Start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT ID,LEADSOURCE FROM LEAD');
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> Llst = New List<Lead>();
        for( Lead L : Scope) {
            L.Leadsource = 'Dreamforce';
            Llst.add(L);
            recordsProcessed++;
        }
        Update Llst;
    }
    
    global void finish(Database.BatchableContext bc){
		System.debug(recordsProcessed + ' records processed. Shazam!');
    }
}