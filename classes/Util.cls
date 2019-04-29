/******************************************************************
|                       ***Accenture***
|
|Classe    : Util.cls
|Autor	 : Victor Nascimento 
|Descrição : Classe contendo métodos para acesso a base.
|
*******************************************************************/

public with sharing class Util {
    
    private static Map<String, Map<String, Id>> fRecTypes = new Map<String, Map<String, Id>> ();
    private static Map<Id, RecordType> lMap;
    
    static {
        lMap = new Map<Id, RecordType> ([select id, RecordType.Name, SobjectType, DeveloperName from RecordType WHERE IsActive = true]);
        
        for (RecordType lRec : lMap.values()) {
            
            Map<String, Id> lObjMap = fRecTypes.get(lRec.SobjectType);
            
            if (lObjMap == null) {
                lObjMap = new Map<String, Id> ();
                fRecTypes.put(lRec.SobjectType, lObjMap);
            }
            lObjMap.put(lRec.DeveloperName, lRec.id);
        }
    }
	//Pegando a Lista de Requisição 
	public static List<Request__c> getlistRequestRecord(String recordId){
		return[SELECT Id, Name, Date__c, Description__c, Status__c FROM Request__c WHERE id = : recordId];
	}


}