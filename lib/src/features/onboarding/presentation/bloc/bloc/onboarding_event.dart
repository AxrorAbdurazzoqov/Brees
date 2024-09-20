part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();
}

class OnIndexChangedEvent extends OnboardingEvent {
  final int currentIndex;
  final VoidCallback onSuccess;

  const OnIndexChangedEvent({required this.currentIndex, required this.onSuccess});

  @override
  List<Object?> get props => [
        currentIndex
      ];
}

class OnSkippedEvent extends OnboardingEvent {
  final VoidCallback onSuccess;

  const OnSkippedEvent({required this.onSuccess});

  @override
  List<Object?> get props => [];
}
