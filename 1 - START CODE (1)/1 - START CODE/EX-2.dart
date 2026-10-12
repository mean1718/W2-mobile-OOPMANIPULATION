class BankAccount {
  // TODO
  int _accountId;
  String _accountOwner;
  double _balance;
  BankAccount(this._accountId, this._accountOwner) : _balance = 0;

  int get accountId => _accountId;
  String get accountOwner => _accountOwner;
  double balance() {
    return _balance;
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception("Withdrawal amount must be positive");
    }

    if (_balance - amount < 0) {
      throw Exception("Insufficient balance for withdrawal");
    }

    _balance -= amount;
  }

  void credit(double amount) {
    if (amount <= 0) {
      throw Exception('Credit amount must be positive');
    }

    _balance += amount;
  }
}

class Bank {
  // TODO
  String name;
  Map<int, BankAccount> _accounts = {};
  Bank({required this.name});
  BankAccount createAccount(int accountId, String accountOwner) {
    if (_accounts.containsKey(accountId)) {
      throw Exception('Account with ID $accountId already exists!');
    }

    BankAccount account = BankAccount(accountId, accountOwner);
    _accounts[accountId] = account;

    return account;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance()); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance()); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance()); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
