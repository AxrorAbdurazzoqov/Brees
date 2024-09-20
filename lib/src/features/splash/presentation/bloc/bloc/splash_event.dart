part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class CheckUserEvent extends SplashEvent {
  final User? user = FirebaseAuth.instance.currentUser;
  final VoidCallback onRegistered;
  final VoidCallback onUnregistered;

  CheckUserEvent({required this.onRegistered, required this.onUnregistered});
  
  @override
  List<Object?> get props => [user];


}