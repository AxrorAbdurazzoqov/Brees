import 'package:brees/src/core/usecase/usecase.dart';
import 'package:brees/src/features/home/data/model/data_model.dart';
import 'package:brees/src/features/home/domain/usecase/upload_userdata_usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserDataUsecase getUserDataUsecase;
  HomeBloc({required this.getUserDataUsecase}) : super(const HomeState(status: HomeStatus.intial)) {
    on<UploadUserDataEvent>((event, emit) {
      FirebaseFirestore.instance.collection('user_data').add(event.data);
      emit(const HomeState(status: HomeStatus.loading));
      add(GetUserDataEvent());
    });

    on<GetUserDataEvent>((event, emit) async {
      final result = await getUserDataUsecase.call(NoParams());
      print(result.isRight);
      if (result.isRight) {
        emit(HomeState(status: HomeStatus.success, data: result.right));
      } else {
        emit(state.copyWith(status: HomeStatus.failure));
      }
    });
  }
}
