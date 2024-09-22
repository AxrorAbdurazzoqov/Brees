import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
    final Account account;

    UserDataModel({
        required this.account,
    });

    factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        account: Account.fromJson(json["account"]),
    );

    Map<String, dynamic> toJson() => {
        "account": account.toJson(),
    };
}

class Account {
    final String id;
    final String name;
    final String currency;
    final double balance;
    final String accountNumber;
    final List<Institution> institutions;
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

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        name: json["name"],
        currency: json["currency"],
        balance: json["balance"]?.toDouble(),
        accountNumber: json["account_number"],
        institutions: List<Institution>.from(json["institutions"].map((x) => Institution.fromJson(x))),
        monthlySpentAmount: json["monthlySpentAmount"]?.toDouble(),
        transactions: List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "currency": currency,
        "balance": balance,
        "account_number": accountNumber,
        "institutions": List<dynamic>.from(institutions.map((x) => x.toJson())),
        "monthlySpentAmount": monthlySpentAmount,
        "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
    };
}

class Institution {
    final String name;
    final String logo;
    final double amount;

    Institution({
        required this.name,
        required this.logo,
        required this.amount,
    });

    factory Institution.fromJson(Map<String, dynamic> json) => Institution(
        name: json["name"],
        logo: json["logo"],
        amount: json["amount"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "logo": logo,
        "amount": amount,
    };
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

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        description: json["description"],
        amount: json["amount"]?.toDouble(),
        date: DateTime.parse(json["date"]),
        currency: json["currency"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "amount": amount,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "currency": currency,
    };
}
