import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/news_app_model.dart';
import '../../../domain/use_case/list_news/list_news_use_case.dart';


class ListNewsController extends GetxController {
  late String? arguments;
  final ListNewsUseCase _listNewsUseCase;
  final newsAppModel = NewsAppModel();
  RxBool isLoading = false.obs;
  RxBool notFound = false.obs;
  ScrollController scrollController = ScrollController();

  final listSourceKey = GlobalKey<FormState>();

  ListNewsController(this._listNewsUseCase);

  @override
  void onInit() {
    arguments = Get.arguments;
    getListNews(id: arguments);
    super.onInit();
  }

  Future<void> getListNews({String? id}) async {
    isLoading.toggle();
    try {
      final response = await _listNewsUseCase.call(id: id ?? '');
      if (response != null) {
        newsAppModel.articles = response.articles;
      } else {
        newsAppModel.articles = [];
      }
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
    }
  }
}
