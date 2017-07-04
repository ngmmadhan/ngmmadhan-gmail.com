({
	packItem : function(component, event, helper) {
        console.log('Test');
				var a = component.get("v.item");
        a.Packed__c = true;
        component.set("v.item",a);

        var packedButton = event.getSource();
        packedButton.set('v.disabled',true);
	},
})