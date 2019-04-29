/******************************************************************
  |                       ***Accenture***
  |
  |Classe    : BatchupdateAllRequest.cls
  |Data      : 17/04/2019
  |Descrição : Classe Batch que faz a atualização dos Request.
  |
  ******************************************************************/
public class BatchupdateAllRequest implements Database.Batchable<sObject> {
  
    public Database.QueryLocator start(Database.BatchableContext bC) {
         
        String query = 'SELECT Id, Status__c FROM Request__c';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bC, List<Request__c> reqList) {
    
	 final List<Request__c> reqList_atual = new List<Request__c>();

        try {
        for(Request__c req : reqList)
        {        
            If(req.Status__c == 'Waiting for User' && req.Date__c <= Date.today()){
                req.Status__c = 'Canceled';
            }
			reqList_atual.add(req); // Update the Account Record
			  
		}
        update reqList_atual;
		System.debug('update o reqList_atual' + reqList_atual);

		Request_Action__c reqAction = new Request_Action__c(
				Description__c = 'It was closed by system.',
				Data__c = Date.today(),
				Responsible__c = reqList_atual[0].Responsible__c,
				New_Status__c = 'Closed'
			);
			insert reqAction; 
			System.debug('Inserindo o reqAction' + reqAction);


        } catch(Exception e) {
		    System.debug('Falhou o Batch');
		    System.debug(e);
        }
         
    }   
     
    public void finish(Database.BatchableContext bC) {
        // execute any post-processing operations
		System.debug(bC);
  }
}