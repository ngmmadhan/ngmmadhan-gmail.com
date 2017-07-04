({
	HandleChildMethod : function(component,event, helper){
		var Arguments = event.getParam("arguments");
		component.set("v.TextAreaAttr", Arguments.Name + '  '+ Arguments.Message);
	},
	fireinformParentevent : function(component, event, helper){
		var evt = component.getEvent("informParent");
		evt.setParams({
		    EventMessage: 'Test Event Message'
		}).fire();
		console.log('Event fired');
	},
})