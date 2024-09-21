part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthStatus status;
  final List<InstructionModel> data = [
    InstructionModel(title: 'Verify your email address', desctiption: 'This is the bank account we would track and manage your spendings', image: AppVectors.instance.email),
    InstructionModel(title: 'Connect your bank account', desctiption: 'This is the bank account we would track and manage your spendings', image: AppVectors.instance.bank),
    InstructionModel(title: 'Setup a security pin', desctiption: 'This is the bank account we would track and manage your spendings', image: AppVectors.instance.lock),
    InstructionModel(title: 'Tell us more about you', desctiption: 'This is the bank account we would track and manage your spendings', image: AppVectors.instance.user),
  ];

  AuthState({
    required this.status,
  }) ;

  AuthState copyWith({AuthStatus? status, bool? isAgree}) => AuthState(status: status ?? this.status);

  @override
  List<Object> get props => [
        status,
      ];
}

enum AuthStatus {
  initial,
  success,
  failure,
  loading
}
