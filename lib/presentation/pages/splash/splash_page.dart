import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_test/infrastructure/navigation/routes.dart';

import '../../../domain/core/constants/color_constants.dart';
import '../../../domain/core/constants/snackbar_constants.dart';

class SplashPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logoWidth: 100,
      logo: Image.asset(
        'assets/images/news_paper.png',
      ),
      title: Text(
        SnackbarConstants.snackbarNewsApp,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: fontAppColor,
      showLoader: true,
      loadingText: Text(SnackbarConstants.snackbarLoading),
      navigator: Routes.CATEGORY,
      durationInSeconds: 5,
      loaderColor: appBarColor,
    );
  }
}
