({
	fetchMapCtrlhelper : function(component,lat,long) {
		var action = component.get('c.getMyMap');
		action.setCallback(this, function(response) {
				//store response state
				var state = response.getState();
				if (state === "SUCCESS") {
					lat(response);
						// create a empty array for store map keys
						var arrayOfMapKeys = [];
						// store the response of apex controller (return map)
						var StoreResponse = response.getReturnValue();
						console.log('StoreResponse Test >>> ' + StoreResponse);
						// set the store response[map] to component attribute, which name is map and type is map.
						component.set('v.fullMap', StoreResponse);

						for (var singlekey in StoreResponse) {
								arrayOfMapKeys.push(singlekey);
						}
						// Set the all list of keys on component attribute, which name is lstKey and type is list.
						component.set('v.lstKey', arrayOfMapKeys);
				} else {
					long(response);
				}
		});
		// enqueue the Action
		$A.enqueueAction(action);
	},
})