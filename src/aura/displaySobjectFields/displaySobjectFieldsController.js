({
	doInit : function(component, event, helper) {
		var varSobject = component.get("v.objSobject");
        var api = component.get("v.fieldapi");
        var arrayRecords = varSobject[api.split('.')[0]];
        if(arrayRecords != undefined && api.indexOf('.')>= 0)
        	component.set("v.fielvalue", arrayRecords[api.split('.')[1]]);
        else
            component.set("v.fielvalue", varSobject[api]);
	}
})