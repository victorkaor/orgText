/******************************************************************
  |                       ***Accenture***
  |
  |Classe    : RequestTriggerHandler.cls
  |Data      : 16/04/2019
  |Descrição : Classe Handler referente à Criação ao Action.
  |
  ******************************************************************/
public class RequestTriggerHandler {

	//Método de Atualização de Status na Hora da Inserção 
	public static void insertStatusRequest() {

		Request_Action__c reqAction = new Request_Action__c();

		for (Request__c request : (List<Request__c>) Trigger.new ){
			if (request.Status__c != null || request.Status__c == null ) {
				request.Status__c = 'New';				
			}else{
                request.addError('Erro impossível atualizar o Status');
            }
		}
	}

	//Método de Atualizaçõa de Tech_Waiting_Date_Max 
	public static void updateTechWaiting(){
		
		final List<Request__c> ltReqAction = new List<Request__c>();
		
		for(Request_Action__c reqAction : (List<Request_Action__c>) Trigger.old){
			if(reqAction.New_Status__c == 'Waiting for User'){
				for(Request__c req : (List<Request__c>) Trigger.old){
					req.TECH_Waiting_Date_Max__c = Date.today();
					ltReqAction.add(req);
				}
				System.debug(reqAction);
			}else{
                reqAction.addError('Erro impossível atualizar o Status');
            }
		}
		update ltReqAction;
	
	}

	/*
	//Método de Atualizaçõa de Status 
	public static void updateStatusOfActforReq(){
	
	}
	*/
}