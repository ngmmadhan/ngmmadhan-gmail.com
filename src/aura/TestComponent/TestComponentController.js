({
	Refreshmethod : function(component, event, helper) {		
		var NameStr = component.get("v.myName");
		console.log('NameStr ' + NameStr);
		component.set('v.myNameClone',NameStr);	
		var strArray = ["Yellow","Blue"];
		console.log('Array' + strArray);
		component.set('v.strArrayview',strArray);
		var Toggle = component.get("v.Toggle");
		component.set("v.Toggle",!Toggle);
		console.log('Toggle' + Toggle);
		console.log(component.get("v.Toggle"));
	},
}