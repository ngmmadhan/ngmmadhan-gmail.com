({
  FireSearchKeyChangeEvent: function(component, event, helper) {
    var myEvent = component.getEvent("SearchKeyChangeEvent"); 
		var searchKey = '';
		if(event.target.value !== null && event.target.value !== undefined){
			searchKey = event.target.value;
		}
    myEvent.setParams({
      "searchKey": searchKey
    });  
    myEvent.fire(); 
  },

  ToggleClosetoSearch: function(component, event, helper) {
  	var reset_input = component.find("reset_input");
  	$A.util.removeClass(reset_input, 'slds-show');
  	$A.util.addClass(reset_input, 'slds-hide');
  	var lookup_input = component.find("lookup_input");
  	$A.util.removeClass(lookup_input, 'slds-hide');
  	$A.util.addClass(lookup_input, 'slds-show');
  },

  ToggleSearchtoClose: function(component, event, helper) {
  	var lookup_input = component.find("lookup_input");
  	$A.util.removeClass(lookup_input, 'slds-show');
  	$A.util.addClass(lookup_input, 'slds-hide');
  	var reset_input = component.find("reset_input");
  	$A.util.removeClass(reset_input, 'slds-hide');
  	$A.util.addClass(reset_input, 'slds-show');
  },
})