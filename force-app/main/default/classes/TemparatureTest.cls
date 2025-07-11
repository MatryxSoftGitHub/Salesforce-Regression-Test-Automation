@isTest
public class TemparatureTest {
@isTest
    private static void wardTempTest(){
Decimal res= Temparature.ftoc(70);
        System.assertEquals(21.11, res);
    }
    
    @isTest
    private static void coldTempTest(){
Decimal res= Temparature.ftoc(32);
        System.assertEquals(0, res);
    }
}