import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/Controller.dart';
import '../../generated/l10n.dart';

TextEditingController _seachController = TextEditingController();
final Controller _controller = Get.find();

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        title: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: 50,
          // color: Colors.white54,
          alignment: Alignment.center,
          child: TextField(
            controller: _seachController,
            textAlign: TextAlign.justify,
            decoration: InputDecoration(
                hintText: S
                    .of(context)
                    .seach_product,
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: 5, color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: 5, color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                border: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: 5, color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            onChanged: (value) {
              _controller.catalogs.value = _controller.catalogs.value
                  .where((element) {
                element.catalogs!.where((element1) {
                  return element1.catalogname!
                      .toLowerCase()
                      .contains(_controller.search.value.toLowerCase());
                }).toList();
                return element.catalogname!
                    .toLowerCase()
                    .contains(_controller.search.value.toLowerCase());
              })
                  .toList();
              _controller.catalogs.refresh();
            },),

        ));
  }
}
