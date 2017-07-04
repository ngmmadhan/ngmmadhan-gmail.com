({
    hanldeclick2 : function(component, event, helper){
      	var buttonClicked = event.getSource();
        var buttonMessage = buttonClicked.get("v.label");  
    },
    hanldeclick3 : function(component, event, helper){
        component.set("v.message",buttonMessage);
    },
	handleclick : function(component, event, helper) {
        var action = component.get("c.handleclick2");
        action.handleclick2();
		//hanldeclick2(component,event,helper);
        //hanldeclick3(component,event,helper);
	},
})