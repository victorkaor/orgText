@isTest
public class BatchupdateAllRequestTest {

    @isTest
    private static void BatAllReq(){
        
       
        
        List<Request__c> ltReq = new List<Request__c>();
        Request__c req = FactoryUtil.createRequest();
        ltReq.add(req);
        req.Status__c = 'Fix in progress';
        insert req;
        
        List<Request_Action__c> ltRequestAction = new List<Request_Action__c>();
        Request_Action__c reqAction = new Request_Action__c();
        insert reqAction;
        
        
        req.Status__c = 'Waiting for User';
        req.Date__c = Date.today();
        update req;
        
        ltRequestAction.add(reqAction);
        reqAction.New_Status__c = 'Waiting for User';
        update reqAction;
        
        
        Test.startTest();
        
        BatchupdateAllRequest btAllreq = new BatchupdateAllRequest();
        Database.executeBatch(btAllreq);
        
        Test.stopTest();
    }
    
}