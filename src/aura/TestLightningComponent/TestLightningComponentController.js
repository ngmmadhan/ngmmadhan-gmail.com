({
    fetchMapCtrl: function(component, event, helper) {
			function lat(response){
				console.log('Response ' + JSON.stringify(response.getReturnValue()));
				console.log('Success');
			}
			function long(response){
				console.log('Error');
			}
        //call apex class method
				helper.fetchMapCtrlhelper(component,lat,long);
    },
})