import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_test/domain/core/constants/content_constants.dart';

import '../../../domain/core/constants/color_constants.dart';
import '../../../domain/entities/utils.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../../controller/category/category_controller.dart';

class CategoryPage extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          centerTitle: true,
          title: Text(
            ContentConstants.categoryNews,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: fontAppColor,
                    width: 3,
                  ),
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage("assets/images/usa.png"),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                    physics: PageScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listOfCategory.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: GestureDetector(
                          onTap: () async {
                            controller.category.value =
                                listOfCategory[index]['code']!;
                            Get.toNamed(Routes.LISTNEWS,
                                arguments: controller.category.value);
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: appBarColor,
                                    borderRadius: BorderRadius.circular(
                                        10),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      listOfCategory[index]['images']!,
                                      width: 40,
                                      height: 70,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 0.5,
                              ),
                              Text(
                                listOfCategory[index]['name']!,
                                style: TextStyle(
                                  color: fontCategoryColor,
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
