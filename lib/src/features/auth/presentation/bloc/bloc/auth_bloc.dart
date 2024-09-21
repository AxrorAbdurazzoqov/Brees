import 'package:brees/src/core/constants/vectors/app_vectors.dart';
import 'package:brees/src/core/utils/firebase_auth_service.dart';
import 'package:brees/src/features/auth/presentation/model/instruction_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState(status: AuthStatus.initial)) {
    on<UserAgreementEvent>(
      (event, emit) {
        emit(state.copyWith(status: AuthStatus.success));
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
      emit(AuthState(status: AuthStatus.success));
    });
    on<SignInEvent>((event, emit) {
      FirebaseAuthService.instance.signInWithEmail(email: event.email, password: event.password, onSuccess: event.onSuccess, onFailure: event.onFailure);
      emit(AuthState(status: AuthStatus.success));
    });
    on<ResetPasswordEvent>((event, emit) async {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: event.email);
    });
  }
}
