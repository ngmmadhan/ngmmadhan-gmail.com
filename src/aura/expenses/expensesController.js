({
	doInit : function(component, event, helper){
			var action = component.get("c.getExpenses");
			action.setCallback(this, function(response){
				var state = response.getState();
				if(component.isValid() && state==='SUCCESS'){
					component.set("v.expensesArr",response.getReturnValue());
				}
				else {
					console.log('Nothing to load ' + state);
				}
			});
			$A.enqueueAction(action);
		},
	clickCreateExpense : function(component, event, helper) {
		var nameField = component.find("expname");
		var expensename = nameField.get("v.value");
		console.log('expensename ' + expensename);
		if($A.util.isEmpty(expensename)){
			nameField.set("v.errors",[{"message":"Expense Name Can\'t be blank"}]);
		}
		else {
			nameField.set("v.errors", null);
			var newExpense = component.get("v.newExpense");
			console.log('New Expense ' + JSON.stringify(newExpense));
			helper.createExpense(component, newExpense);
		}
	},
	handleUpdateExpense: function(component, event, helper) {
		  console.log('Inside updateExpense');
	    var updatedExp = event.getParam("expense");
			console.log('Expense in controller' + JSON.stringify(updatedExp));
	    helper.updateExpense(component, updatedExp);
	},
})