import 'package:news_app_test/domain/entities/category_app_model.dart';

abstract class CategoryRepository {
  Future<CategoryAppModel> getCategory({required String category});
}
