
import 'package:brees/src/core/either/either.dart';
import 'package:brees/src/features/home/data/model/data_model.dart';

abstract class HomeRepository {
  Future<Either<Error, UserDataModel>> getUserData();
}
