import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../domain/core/constants/color_constants.dart';
import '../../../domain/core/constants/content_constants.dart';
import '../../controller/list_news/list_news_controller.dart';

class NewsPage extends GetView<ListNewsController> {
  final newsUrl;

  const NewsPage({Key? key, this.newsUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: fontAppColor),
        elevation: 0,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: Text(ContentConstants.detailNews,
            style: TextStyle(
              color: fontAppColor,
              fontSize: 17,
            )),
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
      body: Container(
          child: WebView(
              initialUrl: newsUrl,
              javascriptMode: JavascriptMode.unrestricted)),
    );
  }
}
