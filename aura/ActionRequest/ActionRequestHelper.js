({
	getRequestController: function (component, event, helper) {
	 
	 var recordId = component.get("v.recordId");
	 var action = component.get("c.getRequests");
	   action.setParams({
	    'recordId' : recordId
		});

		action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               var returnValue = response.getReturnValue();
			   var ltRequest = returnValue.req;
			   console.log('returnValue' + returnValue);
			   console.log(returnValue);
			   console.log('ltRequest' + ltRequest);
			   console.log(ltRequest);
			   component.set('v.responseRequest', returnValue);
			   var test = component.get('v.responseRequest');
			   console.log('Pegando o vResponse');
			   console.log(test);
            }else{
				console.log('Foi Triste');
			}
        });
		$A.enqueueAction(action);	

	}
})