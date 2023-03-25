import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onlinestoreapp/controller/Controller.dart';
import 'package:onlinestoreapp/pages/catalog_page.dart';
import 'package:onlinestoreapp/pages/home.dart';
import 'package:onlinestoreapp/pages/product_page.dart';

import '../generated/l10n.dart';
import 'order_page.dart';

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
        child: Obx(() => Scaffold(
              // appBar: AppBarWidget(),
              body: Stack(
                children: [
                  PageView(
                    children: [
                      ProductPage(),
                      CatalogPage(),
                      OrderPage(),
                      ProductPage(),
                      Container()
                    ],
                    controller: _controllerpage,
                    pageSnapping: false,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    // top: 0,
                    child: BottomNavigationBar(
                        currentIndex: _controller.pageidx.value,
                        unselectedItemColor: Colors.black38,
                        selectedItemColor: Colors.red,
                        onTap: (int i) {
                          _controllerpage.jumpToPage(i);
                          _controller.pageidx.value = i;
                        },
                        showSelectedLabels: true,
                        showUnselectedLabels: true,
                        iconSize: 40,
                        selectedLabelStyle:
                            TextStyle(fontWeight: FontWeight.bold),
                        items: [
                          BottomNavigationBarItem(
                              icon: Icon(Icons.home),
                              label: S.of(context).main),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.search),
                            label: S.of(context).seach,
                          ),
                          BottomNavigationBarItem(
                            icon: Stack(
                              // alignment: Alignment.topRight,
                              children: [
                                Icon(Icons.shopping_basket_outlined),
                                _controller.orders.value.length > 0
                                    ? Positioned(
                                        right: 0,
                                        // left: 2,
                                        // bottom: 25,
                                        // width: 15,
                                        // height: 15,
                                        child: Container(
                                          padding: EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          constraints: BoxConstraints(
                                            minWidth: 15,
                                            minHeight: 15,
                                          ),
                                          child: Text(
                                            _controller.ordercount.value.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ))
                                    : SizedBox(),
                              ],
                            ),
                            label: S.of(context).basket,
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.favorite_border),
                            label: S.of(context).favorite,
                          ),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.exit_to_app_rounded),
                              label: "Exit")
                        ]),
                  ),
                ],
              ),
            )));
  }
}
