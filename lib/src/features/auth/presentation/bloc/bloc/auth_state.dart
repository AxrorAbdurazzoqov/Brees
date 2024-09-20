part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isAgree;
  final AuthStatus status;

  const AuthState({required this.status, this.isAgree = false});

  AuthState copyWith({AuthStatus? status}) => AuthState(status: status ?? this.status);

  @override
  List<Object> get props => [
        status,
        isAgree
      ];
}

enum AuthStatus {
  initial,
  success,
  failure,
  loading
}
