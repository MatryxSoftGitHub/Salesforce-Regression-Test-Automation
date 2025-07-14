public class AccountHandler {
    public static void updateAccountRating(List<Account> accountsToUpdate) {
        for (Account acc : accountsToUpdate) {
            if (acc.AnnualRevenue > 1000000) {
                acc.Rating = 'Hot';
            } else {
                acc.Rating = 'Warm';
            }
        }
        update accountsToUpdate;
    }
}
