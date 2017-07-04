({
	CallChildMethod : function(component,event,helper){
		var NameAttr = component.get("v.Name");
		var MessageAttr = component.get("v.Message");
		var ChildComponent = component.find('PlayTimeChildID');
		ChildComponent.ChildMethod(NameAttr,MessageAttr);
	},
	handleChildEvent : function(component,event,helper){
		alert('Event Message from HandleChildEvent');
	}
})