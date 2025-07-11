public class AccountHelper {
    public static String getWelcomeMessage(String accountName) {
        if (String.isBlank(accountName)) {
            return 'Welcome!';
        }
        return 'Welcome, ' + accountName + '!';
    }
}
