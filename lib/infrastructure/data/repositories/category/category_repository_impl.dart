import 'package:news_app_test/infrastructure/data/data_source/remote/remote_data_source.dart';

import '../../../../domain/entities/category_app_model.dart';
import '../../../../domain/repositories/category/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository{
  final RemoteNewsDataSource remoteNewsDataSource;

  CategoryRepositoryImpl({required this.remoteNewsDataSource});

  @override
  Future<CategoryAppModel> getCategory({required String category}) async {
    final result = await remoteNewsDataSource.getNewsRes(category: category);
    return result;
  }
}