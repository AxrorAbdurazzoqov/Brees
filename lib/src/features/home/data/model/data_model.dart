class Account {
  final String id;
  final String name;
  final String currency;
  final double balance;
  final String accountNumber;
  final List<Map<String, dynamic>> institutions;
  final double monthlySpentAmount;
  final List<Transaction> transactions;

  Account({
    required this.id,
    required this.name,
    required this.currency,
    required this.balance,
    required this.accountNumber,
    required this.institutions,
    required this.monthlySpentAmount,
    required this.transactions,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> institutions = (json['institutions'] as List)
        .map((institution) => {
              'name': institution['name'],
              'logo': institution['logo'] ?? '',
              'amount': institution['amount'] as double,
            })
        .toList();

    List<Transaction> transactions = (json['transactions'] as List).map((transaction) => Transaction.fromJson(transaction)).toList();

    return Account(
      id: json['account']['id'] as String,
      name: json['account']['name'] as String,
      currency: json['account']['currency'] as String,
      balance: json['account']['balance'] as double,
      accountNumber: json['account']['account_number'] as String,
      institutions: institutions,
      monthlySpentAmount: json['monthlySpentAmount'] ?? 0.0,
      transactions: transactions,
    );
  }
}

class Transaction {
  final String id;
  final String description;
  final double amount;
  final DateTime date;
  final String currency;

  Transaction({
    required this.id,
    required this.description,
    required this.amount,
    required this.date,
    required this.currency,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as String,
      description: json['description'] as String,
      amount: json['amount'] as double,
      date: DateTime.parse(json['date']),
      currency: json['currency'] as String,
    );
  }
}
