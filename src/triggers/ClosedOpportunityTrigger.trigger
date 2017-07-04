trigger ClosedOpportunityTrigger on Opportunity (after insert) {
    List<task> Tasklst = new List<task>();
    for(Opportunity o : [SELECT ID FROM Opportunity WHERE ID IN: TRIGGER.NEW AND StageName='Closed Won']){
        task t = new task(Subject='Follow Up Test Task', WhatId=o.Id);
        Tasklst.add(t);
    }
    upsert Tasklst;
}