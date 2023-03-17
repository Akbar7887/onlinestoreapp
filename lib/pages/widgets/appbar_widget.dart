import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/Controller.dart';
import '../../generated/l10n.dart';
import '../../models/catalogs/Catalog.dart';
import '../../models/catalogs/Product.dart';

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
              if (_controller.pageidx.value == 1) {
                filtrCatalogs(value, _controller.catalogs.value);
              } else if (_controller.pageidx.value == 2) {
                filtrProduct(value);
              }
            },
          ),
        ));
  }

  filtrCatalogs(String value, List<Catalog> list) {
    finalList = [];
    if (value != '') {
      list.forEach((element) {
        if (element.catalogname!.toLowerCase().contains(value.toLowerCase())) {
          finalList.add(element);
        }

        if (element.catalogs!.isNotEmpty) {
          filtrCatalogs(value, element.catalogs!);
        }
      });
      _controller.catalogs.value = finalList;

    } else {
      _controller.fetchGetAll();
    }
    _controller.catalogs.refresh();
  }

  filtrProduct(String value) {
    if (value.isNotEmpty) {
      List<Product> finalList = [];

      _controller.products.forEach((element) {
        if (element.name!.toLowerCase().contains(value.toLowerCase())) {
          finalList.add(element);
        }
      });
      _controller.products.value = finalList;

    } else {
      _controller.fetchgetAll(_controller.catalog.value.id != null
          ? _controller.catalog.value.id.toString()
          : "-1");
    }
    _controller.products.refresh();
  }
}
