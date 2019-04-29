trigger RequestTrigger on Request__c (before insert,before update, after insert, after update)  {
	
	if(Trigger.isInsert && Trigger.isBefore){
		RequestTriggerHandler.insertStatusRequest(); //Atualizaçao de Status durante a inserção da Requisição
	}
	if(Trigger.isUpdate && Trigger.isafter){
		RequestTriggerHandler.updateTechWaiting(); //Atualizaçao de TECH_Waiting_Date_Max durante a atualização do Status
	}

 }