import 'package:news_app_test/domain/entities/category_app_model.dart';

import '../../repositories/category/category_repository.dart';

class CategoryUseCase {
  final CategoryRepository _categoryRepository;

  CategoryUseCase(this._categoryRepository);

  Future<CategoryAppModel>call({required String category})async{
    return await _categoryRepository.getCategory(category: category);
  }
}