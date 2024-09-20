import 'package:brees/src/core/constants/vectors/app_vectors.dart';
import 'package:brees/src/features/onboarding/presentation/model/onboarding_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState(index: 0)) {
    on<OnIndexChangedEvent>(
      (event, emit) {
        if (event.currentIndex > 2) {
          add(OnSkippedEvent(onSuccess: event.onSuccess));
          emit(OnboardingState(index: 0));
          return;
        }
        emit(OnboardingState(index: event.currentIndex));
      },
    );

    on<OnSkippedEvent>(
      (event, emit) {
        event.onSuccess();
      },
    );
  }
}
