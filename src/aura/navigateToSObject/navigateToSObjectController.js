({
	navigateToRecord : function(component, event, helper) {
        var device = $A.get("$Browser.formFactor");
        if(device != 'DESKTOP')
        {
            var navEvent = $A.get("e.force:navigateToSObject");
            navEvent.setParams({
                recordId: component.get("v.objSobject").Id,
                slideDevName: "related"
            });
            navEvent.fire();
        }
        else
        {
            window.location.href = '/'+ component.get("v.objSobject").Id;
        }
	}
})