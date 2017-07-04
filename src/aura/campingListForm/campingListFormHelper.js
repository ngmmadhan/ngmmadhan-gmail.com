({
	createItem : function(component, event) {
		var newItem = component.get("v.newItem");
		console.log('Item in Helper Controller ' + JSON.stringify(newItem));
		var updateEvent = component.getEvent("addItem");
		updateEvent.setParams({ "item": newItem });
		updateEvent.fire();
		component.set('v.newItem', {'sobjectType':'Camping_Item__c','Name':'','Quantity__c':0,'Price__c':0,'Packed__c':'false'});
	}
})