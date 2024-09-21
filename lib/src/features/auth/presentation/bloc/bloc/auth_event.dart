part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final VoidCallback onSuccess;
  final VoidCallback onFailure;

  const RegisterEvent({required this.name, required this.email, required this.password, required this.onSuccess, required this.onFailure});
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  final VoidCallback onSuccess;
  final VoidCallback onFailure;

  const SignInEvent({required this.email, required this.password, required this.onSuccess, required this.onFailure});

  @override
  List<Object> get props => [
        onSuccess,
        onFailure
      ];
}

class UserAgreementEvent extends AuthEvent {}

class ResetPasswordEvent extends AuthEvent {
  final String email;

  const ResetPasswordEvent({required this.email});
}
