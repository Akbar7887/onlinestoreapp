import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/Controller.dart';
import '../../generated/l10n.dart';
import '../../models/catalogs/Catalog.dart';
import '../../models/catalogs/Product.dart';

TextEditingController _seachController = TextEditingController();
final Controller _controller = Get.find();
List<Catalog> cataloglList = [];
List<Product> productList = [];

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    productList = _controller.products.value;
    cataloglList = _controller.catalogs.value;

    return AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark,
          //<-- For Android SEE HERE (dark icons)
          statusBarBrightness:
              Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        elevation: 0,
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black26)),
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
                filtrCatalogs(value, cataloglList);
              } else if (_controller.pageidx.value == 2) {
                filtrProduct(value);
              }
            },
          ),
        ));
  }

  filtrCatalogs(String value, List<Catalog> list) {
    if (value.isNotEmpty) {
      list.forEach((element) {
        if (element.catalogname!.toLowerCase().contains(value.toLowerCase())) {
          _controller.catalogs.value.add(element);
        }

        if (element.catalogs!.isNotEmpty) {
          filtrCatalogs(value, element.catalogs!);
        }
      });
      _controller.catalogs.value = cataloglList;
    } else {
      _controller.fetchGetAll();
    }
    _controller.catalogs.refresh();
  }

  filtrProduct(String value) {
    if (value.isNotEmpty) {
      _controller.products.value = productList
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      _controller.fetchgetAll(_controller.catalog.value.id != null
          ? _controller.catalog.value.id.toString()
          : "-1");
    }
    _controller.products.refresh();
  }
}
