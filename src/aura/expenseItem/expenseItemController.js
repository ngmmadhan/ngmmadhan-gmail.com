({
    clickReimbursed: function(component, event, helper) {
        var getexpense = component.get("v.expense");
        console.log('Expense ' + JSON.stringify(getexpense));
        var updateEvent = component.getEvent("updateExpense");
        updateEvent.setParams({ "expense": getexpense });
        updateEvent.fire();
    },
})