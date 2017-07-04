trigger ConcertTrigger on Concert__c (after delete, after insert, after undelete,after update, before delete, before insert, before update) {
    ConcertTriggerHandler handler = new ConcertTriggerHandler(Trigger.isExecuting, Trigger.size);
    if(Trigger.isInsert && Trigger.isBefore){
        handler.OnBeforeInsert(Trigger.new);
    }
}