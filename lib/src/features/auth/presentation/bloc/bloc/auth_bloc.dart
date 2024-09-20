import 'package:brees/src/core/utils/firebase_auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState(status: AuthStatus.initial)) {
    on<UserAgreementEvent>(
      (event, emit) {
        emit(AuthState(isAgree: !state.isAgree, status: AuthStatus.success));
      },
    );
    on<RegisterEvent>((event, emit) {
      FirebaseAuthService.instance.createAccountWithEmail(
        username: event.name,
        email: event.email,
        password: event.password,
        onSuccess: event.onSuccess,
        onFailure: event.onFailure,
      );
      emit(const AuthState(status: AuthStatus.success));
    });
  }
}
