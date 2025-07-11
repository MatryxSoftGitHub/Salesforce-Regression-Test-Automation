@isTest
private class AccountHelperTest {
    @isTest
    static void testWelcomeMessage() {
        String result = AccountHelper.getWelcomeMessage('Matryxsoft');
        System.assertEquals('Welcome, Matryxsoft!', result, 'The welcome message is incorrect');

        String blankResult = AccountHelper.getWelcomeMessage('');
        System.assertEquals('Welcome!', blankResult, 'The default welcome message is incorrect');
    }
}
