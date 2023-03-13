import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/Controller.dart';
import '../../generated/l10n.dart';
import '../../models/catalogs/Catalog.dart';

TextEditingController _seachController = TextEditingController();
final Controller _controller = Get.find();
List<Catalog> finalList = [];

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          // color: Colors.white54,
          alignment: Alignment.center,
          child: TextField(
            controller: _seachController,
            textAlign: TextAlign.justify,
            decoration: InputDecoration(
                hintText: S.of(context).seach_product,
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 5, color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 5, color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 5, color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            onChanged: (value) {
              if (value != '') {
                getCatalogs(value, _controller.catalogs.value);
                _controller.catalogs.value = finalList;
                _controller.catalogs.refresh();
              } else {
                _controller.fetchGetAll();
              }
            },
          ),
        ));
  }

  getCatalogs(String value, List<Catalog> list) {
    finalList = [];

    list.forEach((element) {
      if (element.catalogname!.toLowerCase().contains(value.toLowerCase())) {
        finalList.add(element);
      }
      if (element.catalogs!.isNotEmpty) {
        getCatalogs(value, element.catalogs!);
      }
    });
  }
}
