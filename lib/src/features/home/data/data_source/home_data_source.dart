import 'package:brees/src/features/home/data/model/data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

abstract class HomeDataSource {
  Future<UserDataModel> getUserData();
}

class HomeDataSourceImpl extends HomeDataSource {
  final Dio _dio;

  HomeDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<UserDataModel> getUserData() async {
    try {
      final Response response = await _dio.post('https://jsonplaceholder.typicode.com/posts');
      final QuerySnapshot result = await FirebaseFirestore.instance.collection('user_data').get();
      print("Data: ${result.docs[0].data()}");
      return UserDataModel.fromJson(result.docs[0].data() as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
