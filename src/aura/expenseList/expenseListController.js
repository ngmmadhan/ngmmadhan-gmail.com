({
    update: function(component, evt, helper) {
      var Newexpense = component.get("v.expense");
      // Note that updateExpense matches the name attribute in <aura:registerEvent>
      console.log('expense' + Newexpense);
      var updateEvent = component.getEvent("updateExpense");
      updateEvent.setParams({ "expense": Newexpense }).fire();
    }
})