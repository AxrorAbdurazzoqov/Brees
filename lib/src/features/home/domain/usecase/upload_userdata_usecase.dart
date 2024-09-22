import 'package:brees/src/core/either/either.dart';
import 'package:brees/src/core/usecase/usecase.dart';
import 'package:brees/src/features/home/data/model/data_model.dart';
import 'package:brees/src/features/home/domain/repository/home_repository.dart';

class GetUserDataUsecase extends UseCase<UserDataModel, NoParams> {
  final HomeRepository _repository;

  GetUserDataUsecase({required HomeRepository homeRepository}) : _repository = homeRepository;
  @override
  Future<Either<dynamic, UserDataModel>> call(NoParams params) =>  _repository.getUserData();
}