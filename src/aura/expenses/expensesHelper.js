({
	// createExpense : function(component, expense) {
	// 	var theExpenses = component.get("v.expenses");
	// 	console.log('After Getting theExpenses' + JSON.stringify(theExpenses));
	// 	var newExpense = JSON.parse(JSON.stringify(expense));
	// 	console.log('newExpense' + JSON.stringify(newExpense));
	// 	theExpenses.push(newExpense);
	// 	console.log('Before Setting theExpenses' + JSON.stringify(theExpenses));
	// 	component.set("v.expenses",theExpenses);
	// 	console.log('After Setting theExpenses' + JSON.stringify(theExpenses));
	// },
	createExpense: function(component, newExpense) {
		console.log('Inside helper CreateExpense');
    var action = component.get("c.saveExpense");
    action.setParams({
        "expenseRecord": newExpense
    });
    action.setCallback(this, function(response){
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
					 console.log('Success');
            var expenseslist = component.get("v.expensesArr");
            expenseslist.push(response.getReturnValue());
            component.set("v.expensesArr", expenseslist);
						console.log('Test');
        }
				else {
					console.log('Nothing to load ' + state);
					console.log('Error Message' + response.getError()[0].message);
				}
    });
    $A.enqueueAction(action);
	},
	updateExpense: function(component, expense) {
	    var action = component.get("c.saveExpense");
	    action.setParams({
	        "expenseRecord": expense
	    });
			console.log('Expense in Update expense'+ JSON.stringify(expense));
	    action.setCallback(this, function(response){
	        var state = response.getState();
	        if (component.isValid() && state === "SUCCESS") {
	            // do nothing!
							console.log('Update Success');
	        } else {
						 console.log('Update Failed' + response.getError()[0].message);
					}
	    });
	    $A.enqueueAction(action);
			console.log('End of Update Expense');
	},
})