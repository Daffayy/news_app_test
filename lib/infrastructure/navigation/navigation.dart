import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app_test/presentation/bindings/list_news/list_news_binding.dart';
import 'package:news_app_test/presentation/pages/list_news/list_news_page.dart';
import 'package:news_app_test/presentation/pages/splash/splash_page.dart';

import '../../config.dart';
import '../../presentation/bindings/category/category_binding.dart';
import '../../presentation/pages/category/category_page.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.CATEGORY,
      page: () =>  CategoryPage(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: Routes.LISTNEWS,
      page: () =>  ListNewsPage(),
      binding: ListNewsBinding(),
    ),
  ];
}
