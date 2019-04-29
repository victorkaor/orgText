/******************************************************************
  |                       ***Accenture***
  |
  |Classe    : ActionRequestController.cls
  |Data      : 15/04/2019
  |Descrição : Classe controladora do componente referente à Criação de ActionSupport.
  |
  ******************************************************************/

public with sharing class ActionRequestController {

	@AuraEnabled
	public static Map<String, Object> getRequests(String recordId) {
		Map<String, Object> dataReturn = new Map<String, Object> ();
		
		List<Request__c> ltRequest = [SELECT Id, Name, Date__c, Description__c, Status__c FROM Request__c WHERE id = : recordId];
		if(!ltRequest.isEmpty()){
			dataReturn.put('req', ltRequest);
			dataReturn.put('status', 'success');
		}else{
			dataReturn.put('status', 'error');
			dataReturn.put('nulo', null);
		}		
		return dataReturn;
	}

}