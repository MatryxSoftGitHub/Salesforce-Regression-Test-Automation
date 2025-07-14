@isTest
private class AccountHandlerTest {
    @isTest
    static void testUpdateAccountRating_Hot() {
        Account acc = new Account(Name = 'Test Account', AnnualRevenue = 2000000);
        insert acc;

        acc.AnnualRevenue = 2000000;
        AccountHandler.updateAccountRating(new List<Account>{acc});

        Account updated = [SELECT Rating FROM Account WHERE Id = :acc.Id];
        System.assertEquals('Hot', updated.Rating);
    }

    @isTest
    static void testUpdateAccountRating_Warm() {
        Account acc = new Account(Name = 'Test Account 2', AnnualRevenue = 500000);
        insert acc;

        acc.AnnualRevenue = 500000;
        AccountHandler.updateAccountRating(new List<Account>{acc});

        Account updated = [SELECT Rating FROM Account WHERE Id = :acc.Id];
        System.assertEquals('Warm', updated.Rating);
    }
}
