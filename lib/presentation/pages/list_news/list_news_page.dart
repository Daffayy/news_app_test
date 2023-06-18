import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_test/domain/core/constants/color_constants.dart';
import 'package:news_app_test/domain/core/constants/content_constants.dart';
import 'package:skeletons/skeletons.dart';
import '../../controller/list_news/list_news_controller.dart';
import '../news/news_page.dart';

class ListNewsPage extends GetView<ListNewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgApp,
      appBar: AppBar(
        iconTheme: IconThemeData(color: fontAppColor),
        backgroundColor: appBarColor,
        elevation: 0,
        centerTitle: true,
        title: Text("${controller.arguments!.capitalizeFirst} "
            "${ContentConstants.news}",
            style: TextStyle(color: fontAppColor,fontSize: 17)),
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
          ),
        ],
      ),
      body: GetBuilder<ListNewsController>(
        builder: (controller) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: bgApp,
                  border: Border.all(
                    color: publishedAt
                  )
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search_sharp),
                    hintText: ContentConstants.hintext,
                    border: InputBorder.none,
                  ),
                  scrollPadding: EdgeInsets.all(5),
                ),
              ),
              Expanded(
                child: controller.isLoading.value
                    ? SkeletonListView()
                    : ListView.builder(
                  controller: controller.scrollController,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Card(
                            color: bgCard,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(NewsPage(
                                  newsUrl: controller
                                      .newsAppModel.articles![index].url,
                                ));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 15,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${controller.newsAppModel.articles![index].title}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 40),
                                    Text(
                                      "${controller.newsAppModel.articles![index].author}",
                                      style: TextStyle(
                                        color: author,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      "${controller.newsAppModel.articles![index].publishedAt}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: publishedAt,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        index == controller.newsAppModel.articles!.length - 1 &&
                            controller.isLoading == true
                            ? Center(child: CircularProgressIndicator())
                            : SizedBox(),
                      ],
                    );
                  },
                  itemCount: controller.newsAppModel.articles!.length,
                ),
              ),
            ],
          );
        },
      ),

    );
  }
}
