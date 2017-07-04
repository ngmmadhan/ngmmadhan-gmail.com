({
	submitForm : function(component, event, helper) {
		var itemNamevalue = component.find("itemName");
		var itemvalue = itemNamevalue.get("v.value");
		console.log('ItemName ' + itemvalue);
		if(itemvalue != null || itemvalue != '') {
			helper.createItem(component, event);
		}
	}
})