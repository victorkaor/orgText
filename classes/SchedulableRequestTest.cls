@isTest
public class SchedulableRequestTest {

    
    @isTest
    private static void scheduleRequestT(){
        
        Test.startTest();
       
        SchedulableRequest sch = new SchedulableRequest();
        String cron = '0 0 14 * * ?';
        system.schedule('SchedulableRequest2', cron, sch);
        
        Test.stopTest();
        
    }
}