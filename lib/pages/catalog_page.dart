import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onlinestoreapp/controller/Controller.dart';
import 'package:onlinestoreapp/models/UiO.dart';
import 'package:onlinestoreapp/pages/widgets/appbar_widget.dart';
import 'package:onlinestoreapp/pages/widgets/bottomnavigationbar_body.dart';

import '../models/catalogs/Catalog.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  Controller _controller = Get.put(Controller());

  // List<String> _list = ["fdb", "dfbd", "egre"];
  List<bool> _listEnable = [];

  @override
  void initState() {
    super.initState();
  }

  Widget listViewHierarhic(BuildContext context, List<Catalog> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, idx) {
        return Container(
            decoration: BoxDecoration(),
            child: ExpansionTile(
                leading: Image.network(
                  "${UiO.url}doc/catalog/download/${list[idx].id}",
                  width: 30,
                  height: 30,
                  errorBuilder: (
                    BuildContext context,
                    Object error,
                    StackTrace? stackTrace,
                  ) {
                    return Icon(
                      Icons.photo,
                      color: Colors.blue,
                    );
                  },
                ),
                title: Text(list[idx].catalogname!),
                trailing: _listEnable[idx]
                    ? Icon(Icons.keyboard_arrow_down)
                    : Icon(Icons.keyboard_arrow_right),
                onExpansionChanged: (value) {
                  setState(() {
                    _listEnable[idx] = !_listEnable[idx];
                  });
                },
                children: list[idx]
                    .catalogs!
                    .map((e) => ExpansionTile(title: Text(e.catalogname!)))
                    .toList()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(),
        body: Obx(() {
          if (_listEnable.isEmpty) {
            _listEnable = List.filled(_controller.catalogs.value.length, true);
          }
          return Container(
              child: listViewHierarhic(context, _controller.catalogs.value));
        }));
  }
}
