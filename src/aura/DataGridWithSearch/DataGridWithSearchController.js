({
    doInit: function(component, event, helper) {
      var query = component.get('v.query');
      component.set("v.objectList", []);
      helper.readRaw(component, event, helper, query, function(response) {
        if (response !== null && response !== undefined) {
          if (response["sObjectList"] != undefined && response["sObjectList"] != null) {
            component.set("v.objectList", []);
            component.set("v.objectList", response["sObjectList"]);
            component.set('v.DisplayobjectList', response["sObjectList"]);
						component.set("v.totalSize", component.get("v.DisplayobjectList").length);
          }
        }
      });
    },
		abc:function(component,event,helper){

			console.log(event.getSource());
			console.log(event.getSource().getLocalId());
			console.log(event.getSource().get("v.labelClass"));

		},
    handleSearchKeyChange: function(component, event) {

      var searchKeyParentWarrantyJobCode = component.get("v.searchKeyParentWarrantyJobCode");
      var searchKeyWarrantyJobCode = component.get("v.searchKeyWarrantyJobCode");
      var searchKeyDescription = component.get("v.searchKeyDescription");
			component.set('v.FilteredobjectList', component.get('v.objectList'));
      component.set('v.DisplayobjectList', component.get('v.objectList')); // In case searchKey is empty

      var searchKey = ''
      if (event.getParam("searchKey") != '') {
        searchKey = '.*' + event.getParam("searchKey").toLowerCase() + '.*';
      }

			var componentId = event.getSource().getLocalId();
			switch (componentId) {
				case "Parent_Warranty_Code":
					{
						component.set('v.searchKeyParentWarrantyJobCode', searchKey);
						searchKeyParentWarrantyJobCode = component.get("v.searchKeyParentWarrantyJobCode");
						break;
					}
				case "Job_Code":
					{
						component.set('v.searchKeyWarrantyJobCode', searchKey);
						searchKeyWarrantyJobCode = component.get("v.searchKeyWarrantyJobCode");
						break;
					}
				case "Desription":
					{
						component.set('v.searchKeyDescription', searchKey);
						searchKeyDescription = component.get("v.searchKeyDescription");
						break;
					}
			}

      // Filter Matching Warranty Code
      if (searchKeyParentWarrantyJobCode != '') {
        var filteredArray = component.get("v.FilteredobjectList").filter(function(ObjectItem) {
          var hasParent = ObjectItem.Parent_Warranty_Code__c == undefined ? false : true; // Optional Fields
          return (hasParent && ObjectItem.Parent_Warranty_Code__r.Name.toLowerCase().match(searchKeyParentWarrantyJobCode))
        });

        component.set('v.FilteredobjectList', filteredArray);
	    	component.set('v.DisplayobjectList', component.get('v.FilteredobjectList'));
      }

      // Filter Matching Warranty Code
      if (searchKeyWarrantyJobCode != '') {
        var filteredArray = component.get("v.FilteredobjectList").filter(function(ObjectItem) {
            return ObjectItem.Warranty_Code__c.toLowerCase().match(searchKeyWarrantyJobCode)
        });

      component.set('v.FilteredobjectList', filteredArray);
    	component.set('v.DisplayobjectList', component.get('v.FilteredobjectList'));
    }

    // Filter Matching Description
    if (searchKeyDescription != '') {
      var filteredArray = component.get("v.FilteredobjectList").filter(function(ObjectItem) {
        var hasDescription = ObjectItem.Description__c == undefined ? false : true; // Optional Fields
        return (hasDescription && ObjectItem.Description__c.toLowerCase().match(searchKeyDescription))
      });

      component.set('v.FilteredobjectList', filteredArray);
	    component.set('v.DisplayobjectList', component.get('v.FilteredobjectList'));
    }
			component.set("v.totalSize", component.get("v.DisplayobjectList").length);
  },
	OnCheckboxSelect: function(component, event, helper) {
		var ObjectList = component.get('v.objectList');
		var DisplayobjectList = component.get('v.DisplayobjectList');
		for(i = 0 ;i < ObjectList.length; i++) {
					 for(j = 0;j < DisplayobjectList.length; j++) {
							 if(ObjectList[i].Id == DisplayobjectList[j].Id) {
									 ObjectList[i].isChecked = DisplayobjectList[j].isChecked;
							 }
					 }
		 }
		 component.set("v.SelectedItemsCount",DisplayobjectList.filter(function(objectItem){ return objectItem.isChecked; }).length);
	},
	OnNext: function(component, event, helper) {
		 var start = component.get('v.start');
		 var end = component.get('v.end');
		 component.set("v.start",parseInt(start) + parseInt(component.get("v.pageSize")));
		 component.set("v.end",parseInt(end) + parseInt(component.get("v.pageSize")));
	},

	OnPrevious: function(component, event, helper) {
		 var start = component.get('v.start');
		 var end = component.get('v.end');
		 component.set("v.start",parseInt(start) - parseInt(component.get("v.pageSize")));
		 component.set("v.end",parseInt(end)- parseInt(component.get("v.pageSize")));
	},

	updateReasonAdditionalLaborHours: function(component, event, helper){
		var rowID = event.target.id.split("-")[1];
		var ObjectItem = component.get("v.DisplayobjectList")[rowID];
		component.set("v.DisplayobjectList.Reason_Additional_Labor_Hours",event.target.value);
		component.get("v.objectList").filter(function(O,i) {
			if(ObjectItem.Id===O.Id) {
				component.get("v.objectList")[i].Reason_Additional_Labor_Hours = event.target.value;
			}return (null)
		});
	},
	updateAdditionalLaborHours: function(component, event, helper){
		var rowID = event.target.id.split("-")[1];
		var ObjectItem = component.get("v.DisplayobjectList")[rowID];
		component.set("v.DisplayobjectList.Additional_Labor_Hours",event.target.value);
		component.get("v.objectList").filter(function(O,i) {
			if(ObjectItem.Id===O.Id) {
				component.get("v.objectList")[i].Additional_Labor_Hours = event.target.value;
			}return (null)
		});
	},
	OnSaveJobCode: function(component, event, helper){
		var myEvent = component.getEvent("SaveJobCodeEvent"); 
    myEvent.setParams({
      "JobCodeList": component.get("v.objectList").filter(function(objectItem){return objectItem.isChecked;})
    });  
    myEvent.fire(); 
		console.log('Checked Item ' + JSON.stringify(component.get("v.objectList").filter(function(objectItem){return objectItem.isChecked;})));
	},
})