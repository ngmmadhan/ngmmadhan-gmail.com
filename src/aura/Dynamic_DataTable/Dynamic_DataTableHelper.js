({
	loadSobjects : function(component) {
        var action = component.get("c.fetchRecords");
        action.setParams({ strQuery : component.get("v.query")});
        action.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
				component.set("v.lstSobject", result.lstSobject);
                component.set("v.lstFieldApi", result.lstFieldApi);
                component.set("v.lstFieldLabel", result.lstFieldLabel);
                
                setTimeout(function(){ $('#example').DataTable(); }, 500);
            }
            else if (state === "ERROR") {
                $A.log("Errors", a.getError());
            }
        });
        $A.enqueueAction(action);
	}
})