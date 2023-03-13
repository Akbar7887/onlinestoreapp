import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:onlinestoreapp/pages/catalog_page.dart';
import 'package:onlinestoreapp/pages/home.dart';
import 'package:onlinestoreapp/pages/widgets/appbar_widget.dart';
import 'package:onlinestoreapp/pages/widgets/bottomnavigationbar_body.dart';

import '../generated/l10n.dart';

PageController _controllerpage =
    PageController(viewportFraction: 1, keepPage: true);
int page = 1;

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
        child: Scaffold(
          // appBar: AppBarWidget(),
          body: Stack(
            children: [
              PageView(
                children: [Home(), CatalogPage(), CatalogPage()],
                controller: _controllerpage,
                pageSnapping: false,
                physics: NeverScrollableScrollPhysics(),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: BottomNavigationBar(
                    onTap: (int i) {
                        _controllerpage.jumpToPage(i);
                    },
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: S.of(context).main),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: S.of(context).seach,
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.exit_to_app_rounded), label: "Exit")
                    ]),
              ),
            ],
          ),
        ));
  }
}
