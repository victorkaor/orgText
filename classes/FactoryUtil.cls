/******************************************************************
  |                       ***Accenture***
  |
  |Classe    : FactoryUtil.cls
  |Autor	 : Victor Nascimento 
  |Descrição : Classe contendo métodos para acesso a inserção de valores.
  |
 *******************************************************************/
public class FactoryUtil {

	public static Request__c createRequest() {
		Request__c req = new Request__c(
		                                Type__c = 'New Request',
		                                Priority__c = 'Low',
		                                Date__c = Date.today(),
		                                TECH_Waiting_Date_Max__c = Date.today(),
		                                Status__c = 'New',
		                                Description__c = 'test',
		                                Total_of_Actions__c = 5,
		                                Time_average_per_Action__c = 5
		);

		return req;
	}
    public static Request_Action__c createRequestAction(){
        Request_Action__c reqAction = new Request_Action__c(
				Description__c = 'It was closed by system.',
				Data__c = Date.today(),
				Responsible__c = 'test',
				New_Status__c = 'Closed'
			);
        
        return reqAction; 
        
    }

}