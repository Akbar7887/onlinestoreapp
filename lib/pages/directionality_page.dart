import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onlinestoreapp/controller/Controller.dart';
import 'package:onlinestoreapp/pages/catalog_page.dart';
import 'package:onlinestoreapp/pages/home.dart';
import 'package:onlinestoreapp/pages/product_page.dart';

import '../generated/l10n.dart';

PageController _controllerpage =
    PageController(viewportFraction: 1, keepPage: true);
int page = 1;
int currentidx = 0;
final Controller _controller = Get.find();

class DirectionalityPage extends StatelessWidget {
  const DirectionalityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // await showDialog or Show add banners or whatever
          // return true if the route to be popped
          return false; // return false if you want to disable device back button click
        },
        child: Obx(()=> Scaffold(
          // appBar: AppBarWidget(),
          body: Stack(
            children: [
              PageView(
                children: [Home(), CatalogPage(),  ProductPage(), Container()],
                controller: _controllerpage,
                pageSnapping: false,
                physics: NeverScrollableScrollPhysics(),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: BottomNavigationBar(
                    currentIndex: _controller.pageidx.value,
                    unselectedItemColor: Colors.black38,
                    selectedItemColor: Colors.red,
                    onTap: (int i) {
                      _controllerpage.jumpToPage(i);
                      _controller.pageidx.value = i;
                    },
                    selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: S.of(context).main),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: S.of(context).seach,
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.category),
                        label: S.of(context).product,
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.exit_to_app_rounded), label: "Exit")
                    ]),
              ),
            ],
          ),
        )));
  }
}
