import 'package:brees/src/core/either/either.dart';
import 'package:brees/src/features/home/data/data_source/home_data_source.dart';
import 'package:brees/src/features/home/data/model/data_model.dart';
import 'package:brees/src/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepositoryImpl({required HomeDataSource homeDataSource}) : _homeDataSource = homeDataSource;

  @override
  Future<Either<Error, UserDataModel>> getUserData()async {
    try {
      final result = await _homeDataSource.getUserData();
      return Right(result);
    } catch (e) {
      return Left(Error());
    }
  }

}