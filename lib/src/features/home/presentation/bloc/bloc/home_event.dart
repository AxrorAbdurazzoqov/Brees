part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class UploadUserDataEvent extends HomeEvent {
  final Map<String, dynamic> data = {
    "account": {
      "id": "abc12345",
      "name": FirebaseAuth.instance.currentUser!.displayName,
      "currency": "USD",
      "balance": 15430.50,
      "account_number": "1234567890",
      "institutions": [
        {
          "name": "Kuda Bank",
          "logo": "https://firebasestorage.googleapis.com/v0/b/brees-18761.appspot.com/o/Kuda%20Bank.png?alt=media&token=29a86014-f2fe-447d-9d30-8b2af7089d77",
          "amount": 10345.75
        },
        {
          "name": "GT Bank",
          "logo": "https://firebasestorage.googleapis.com/v0/b/brees-18761.appspot.com/o/GTBank.png?alt=media&token=77df649e-3883-4c6b-af4a-dc9b1fd083f6",
          "amount": 5084.39
        },
        {
          "name": "PiggyVest",
          "logo": "https://firebasestorage.googleapis.com/v0/b/brees-18761.appspot.com/o/PiggyVest.png?alt=media&token=bae9a331-e007-4885-bc44-7647cdd5999f",
          "amount": 20046.34
        },
        {
          "name": "UBA",
          "logo": "https://firebasestorage.googleapis.com/v0/b/brees-18761.appspot.com/o/UBA.png?alt=media&token=4e7b8056-871d-4cd1-b88b-f34a65d0d720",
          "amount": 8034.45
        },
      ],
      "monthlySpentAmount": 1299.99,
      "transactions": [
        {
          "id": "txn001",
          "description": "Grocery Store",
          "amount": 150.00,
          "date": "2024-09-20",
          "currency": "USD"
        },
        {
          "id": "txn002",
          "description": "Online Subscription",
          "amount": 9.99,
          "date": "2024-09-18",
          "currency": "USD"
        },
        {
          "id": "txn003",
          "description": "Coffee Shop",
          "amount": 5.50,
          "date": "2024-09-16",
          "currency": "USD"
        }
      ]
    }
  };
}

class GetUserDataEvent extends HomeEvent {}
