@isTest
public class AccountHelperTest {
    @isTest
    static void testGreeting() {
        String result = AccountHelper.getGreeting('Prajwal');
        System.assertEquals('Hello, Prajwal!', result);
    }
}