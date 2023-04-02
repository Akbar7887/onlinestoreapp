import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onlinestoreapp/controller/Controller.dart';
import 'package:onlinestoreapp/models/UiO.dart';
import 'package:onlinestoreapp/pages/widgets/appbar_widget.dart';

import '../models/catalogs/Catalog.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final Controller _controller = Get.find();


  @override
  void initState() {
    super.initState();
  }

  void onTapRow(int idx){

    if(_controller.catalogs.value[idx].catalogs!.isEmpty){

      _controller.page.value = 2;
    }
  }

  List<InkWell> childList(List<Catalog> list ){
    return list
        .map((e) => InkWell(
        onTap: (){
          onTapRow(list.indexOf(e));
        },
        child: Padding(
        padding: EdgeInsets.only(left: 50),
        child: ExpansionTile(
          leading: Image.network(
            "${UiO.url}doc/catalog/download/${e.id}",
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
          title: Text(e.catalogname!),
          children: childList(e.catalogs!)
        ))))
        .toList();
  }

  Widget listViewHierarhic(BuildContext context, List<Catalog> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, idx) {
        return InkWell(
            onTap: (){
              onTapRow(idx);
            },
            child: Column(
            // decoration: BoxDecoration(
            //     border: Border(top: BorderSide(color: Colors.black))),
            children: [
              ExpansionTile(
                  leading: Image.network(
                    "${UiO.url}doc/catalog/download/${list[idx].id}",
                    width: MediaQuery.of(context).size.width/6,
                    height: MediaQuery.of(context).size.height/6,
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
                  // trailing: _listEnable[idx]
                  //     ? Icon(Icons.keyboard_arrow_down)
                  //     : Icon(Icons.keyboard_arrow_right),
                  // onExpansionChanged: (value) {
                  //   setState(() {
                  //     _listEnable[idx] = !_listEnable[idx];
                  //   });
                  // },
                  children: childList(list[idx].catalogs!)),
              Divider()
            ]));
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBarWidget(),
        body: Obx(() {
          return Container(
              child: listViewHierarhic(context, _controller.catalogs.value));
        }));
  }
}