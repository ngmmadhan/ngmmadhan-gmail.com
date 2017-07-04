({
	NavigateToComponent2: function(component, event, helper) {
		// ******************************************************************
		// As of now e.force:NavigateToComponent2 is in Beta and NOT working
		// As of now e.force:NavigateToComponent2 is in Beta and NOT working
		// As of now e.force:NavigateToComponent2 is in Beta and NOT working
		// As of now e.force:NavigateToComponent2 is in Beta and NOT working
		// ******************************************************************
	    var evt = $A.get("e.force:navigateToComponent");
			console.log('evt' + evt);
	        evt.setParams({
	                componentDef: "ComponentB",
	                componentAttributes: {
	                myAttribute: component.get("v.accountid")
	            }
	        });
	    evt.fire();
		},
			navigate : function(component, event, helper) {

			    //Find the text value of the component with aura:id set to "address"
			    //var address = component.find("address").get("v.value");
			    var urlEvent = $A.get("e.force:navigateToURL");
			    urlEvent.setParams({
			      "url": 'https://www.google.com/'
			    });
			    urlEvent.fire();
			},
	gotoRelatedList : function (component, event, helper) {
	    var relatedListEvent = $A.get("e.force:navigateToRelatedList");
	    relatedListEvent.setParams({
	        "relatedListId": "Cases",
	        "parentRecordId": component.get("v.contactid")
	    });
	    relatedListEvent.fire();
	},
	createRecord : function (component, event, helper) {
	    var navEvt = $A.get("e.force:navigateToSObject");
	    navEvt.setParams({
	      "recordId": "0032800000w0dqC",
	      "slideDevName": "related"
	    });
	    navEvt.fire();
	},
	showToast : function(component, event, helper) {
	    var toastEvent = $A.get("e.force:showToast");
	    toastEvent.setParams({
	        "title": "Success!",
					"type":"success",
	        "message": "The record has been updated successfully."
	    });
	    toastEvent.fire();
	}
})