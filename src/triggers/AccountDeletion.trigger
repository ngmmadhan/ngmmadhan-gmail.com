trigger AccountDeletion on Account (before insert) {
    for(Account a : [SELECT ID FROM ACCOUNT WHERE ID IN (SELECT AccountId FROM Opportunity) AND ID IN : TRIGGER.OLD]){
        Trigger.oldMap.get(a.Id).adderror('Cannot delete account with Opportunities');
    }
}