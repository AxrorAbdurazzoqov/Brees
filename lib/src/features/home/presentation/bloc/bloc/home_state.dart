part of 'home_bloc.dart';

class HomeState extends Equatable {
  final HomeStatus status;
  final UserDataModel? data;

  const HomeState({this.data, required this.status});

  HomeState copyWith({HomeStatus? status, UserDataModel? data}) => HomeState(status: status ?? this.status, data: data ?? this.data);

  @override
  List<Object?> get props => [
        status,
        data,
      ];
}

enum HomeStatus {
  intial,
  loading,
  success,
  failure
}
