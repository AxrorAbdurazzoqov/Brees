import 'package:brees/src/features/navbar/presentation/bloc/navbar_event.dart';
import 'package:brees/src/features/navbar/presentation/bloc/navbar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarState()) {
    on<OnNavbarIndexChangedEvent>(
      (event, emit) {
        emit(NavbarState(currentIndex: event.index));
      },
    );
  }
}
