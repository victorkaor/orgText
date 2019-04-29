/******************************************************************
  |                       ***Accenture***
  |
  |Classe    : SchedulableRequest.cls
  |Data      : 17/04/2019
  |Descrição : Classe SchedulableRequest que faz a executa as 23 horas o Batch dos Request.
  |
  ******************************************************************/

public class SchedulableRequest implements Schedulable{
	/**
	    código para agendar via execute anonymous
        SchedulableRequest sch = new SchedulableRequest();
        String cron = '0 0 14 * * ?';
        system.schedule('SchedulableRequest', cron, sch);
    //
	 */ 
	public void execute(SchedulableContext sc) {
		BatchupdateAllRequest batchRequest = new BatchupdateAllRequest();
		Database.executeBatch(batchRequest);
		
	}
}