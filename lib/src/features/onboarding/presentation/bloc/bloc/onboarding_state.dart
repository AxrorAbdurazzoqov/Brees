part of 'onboarding_bloc.dart';

class OnboardingState extends Equatable {
  final int index;

  final List<OnboardingModel> data = [
    OnboardingModel(
      image: AppVectors.instance.onboarding1,
      title: "You ought to know where your money goes",
      description: "Get an overview of how you are performing and motivate yourself to achieve even more.",
    ),
    OnboardingModel(
      image: AppVectors.instance.onboarding2,
      title: "Gain total control of your money",
      description: "Track your transaction easily, with categories and financial report",
    ),
    OnboardingModel(
      image: AppVectors.instance.onboarding3,
      title: "Plan ahead and manage your money better",
      description: "Setup your budget for each category so you in control. Track categories you spend the most money on",
    ),
  ];

  OnboardingState({required this.index});


  @override
  List<Object?> get props => [
        data,
        index
      ];
}
