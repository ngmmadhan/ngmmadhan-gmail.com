public class ExpensesController {

    @AuraEnabled
    public static List<Expense__C> getExpenses(){
        return[SELECT ID,Name,Amount__c, Client__c, Date__c, Reimbursed__c, CreatedDate FROM Expense__c];
    }


    @AuraEnabled
    public static Expense__c saveExpense(Expense__c expenseRecord) {
      //system.debug('Test' + json.serialize(expenseRecord));
        // Perform isUpdatable() checking first, then
        upsert expenseRecord;
        return expenseRecord;
    }
}