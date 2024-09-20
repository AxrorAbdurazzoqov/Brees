import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<CheckUserEvent>(
      (event, emit) async {
        await Future.delayed(const Duration(seconds: 3));
        if (event.user == null) {
          event.onUnregistered();
          
        } else {
          event.onRegistered();
        }
      },
    );
  }
}
