({
	// saveItem : function(component, event, helper) {
	// 		console.log('on Save Item');
	// 		var ItemName = component.find('itemName').get("v.value");
	// 		var ItemQty = component.find('itemQty').get("v.value");
	// 		var ItemPrice = component.find('itemPrice').get("v.value");
	// 		var ItemPacked = component.find('itemPacked').get("v.value");
	// 		if($A.util.isEmpty(ItemName) || $A.util.isEmpty(ItemQty) || $A.util.isEmpty(ItemPrice) || $A.util.isEmpty(ItemPacked)) {
	// 			console.log('All fields are empty');
	// 		} else {
	// 			var newitem = component.get('v.newItem');
	// 			console.log('newItem');
	// 			newitem.Name = ItemName;
	// 			newitem.Quantity__c = ItemQty;
	// 			newitem.Price__c = ItemPrice;
	// 			newitem.Packed__c = ItemPacked;
	// 			console.log('New Item values :' + JSON.stringify(newitem));
	// 			var varitems = component.get('v.items');
	// 			varitems.push(newitem);
	// 			component.set('v.items',varitems);
	// 			var itemstoPrint = component.get('v.items');
	// 			console.log('items array' + JSON.stringify(itemstoPrint));
	// 			component.set('v.newItem', {'sobjectType':'Camping_Item__c','Name':'','Quantity__c':0,'Price__c':0,'Packed__c':'false'});
	// 			console.log('After reset ' +  component.get('v.newItem'));
	// 		}
	// },
	handleAddItem : function(component, event, helper) {
		console.log('Inside cmpsaveItem');
		//var newItem1 = component.get("v.newItem");
	  var campingItemLocal = event.getParam("item");
		console.log('campingItemLocal' + JSON.stringify(campingItemLocal));
		helper.createItem(component,campingItemLocal);
	},
	createItem : function(component, newItem) {
		var action = component.get("c.saveItem");
		action.setParams({
				"item" : newItem 
		});
		action.setCallback(this, function(response){
				var state = response.getState();
				if(component.isValid() && state === 'SUCCESS'){
						var varitems = component.get("v.items");
						varitems.push(response.getReturnValue());
						component.set("v.items",varitems);
						component.set('v.newItem', {'sobjectType':'Camping_Item__c','Name':'','Quantity__c':0,'Price__c':0,'Packed__c':'false'});
				}
		});
		$A.enqueueAction(action);
	},
		doInit : function(component, event, helper) {
				var action = component.get("c.getItems");
				action.setCallback(this, function(response){
						var state = response.getState();
						if(component.isValid() && state==='SUCCESS') {
							 component.set("v.items",response.getReturnValue());
						} else {
							  console.log('Error !!!!');
						}
				});
				$A.enqueueAction(action);
	},
})