
import 'package:get/get_connect/connect.dart';
import 'package:news_app_test/domain/entities/category_app_model.dart';

import '../../../../domain/core/constants/storage_constants.dart';
import '../../../../domain/entities/news_app_model.dart';

class RemoteNewsDataSource{
  final GetConnect _connect;

  RemoteNewsDataSource({required GetConnect connect}) : _connect = connect;

  Future<CategoryAppModel> getNewsRes({required String category}) async {
    final url = "top-headlines?country=in&category=$category&${StorageConstants.token}";
    final response = await _connect.get(
      url,
      decoder: (data) => CategoryAppModel.fromJson(data),
    );
    if (!response.hasError) {
      return response.body!;
    } else {
      throw Exception('error');
    }
  }
  Future<NewsAppModel> getListNewsRes({required String id}) async {
    final response = await _connect.get(
      "everything?q=$id&apiKey=2c06313242f34a50812b97111fea7f2f",
      decoder: (data) => NewsAppModel.fromJson(data),
    );
    if (!response.hasError) {
      return response.body!;
    } else {
      throw Exception('error');
    }
  }
}