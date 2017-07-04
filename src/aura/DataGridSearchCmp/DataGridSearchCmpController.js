({
  searchRecords: function(component, event, helper) {     
		var searchKeyText = event.target.value;
		if( !$A.util.isEmpty(searchKeyText)){
			helper.ToggleSearchtoClose(component, event, helper);
		} else {
			helper.ToggleClosetoSearch(component, event, helper);
		}
		helper.FireSearchKeyChangeEvent(component, event, helper);    
  },

	resetInput: function(component, event, helper) {
		component.set("v.searchKey","");
		console.log('Search ' + component.get("v.searchKey"));
		helper.FireSearchKeyChangeEvent(component, event, helper); 
		helper.ToggleClosetoSearch(component, event, helper);
	},
})