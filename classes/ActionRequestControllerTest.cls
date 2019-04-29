@isTest
private class ActionRequestControllerTest {



	@IsTest
	private static void actRequestController() {

		Request__c req = FactoryUtil.createRequest();
		insert req;

		Test.startTest();
		Map<String, Object> mapReq = ActionRequestController.getRequests(req.id);
		System.debug(mapReq);

		System.assertEquals('success', mapReq.get('status'));
		Test.stopTest();

	}
	@IsTest
	private static void actRequestControllerFail() {

		Test.startTest();
		Map<String, Object> mapReq = ActionRequestController.getRequests(null);

		System.assertEquals('error', mapReq.get('status'));
		Test.stopTest();

	}

}