({
	doInit  : function(component, event, helper) {
        var map = component.get("v.map"); 
        var key = component.get("v.key");
        // set the values of map to the value attribute	
        // to get map values in lightning component use "map[key]" syntax. 
        component.set("v.value" , map[key]);		
	}
})