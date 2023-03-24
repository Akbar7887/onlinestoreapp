import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:onlinestoreapp/controller/Controller.dart';
import 'package:onlinestoreapp/models/UiO.dart';
import 'package:onlinestoreapp/models/constants/main_constant.dart';
import 'package:onlinestoreapp/pages/product_one_page.dart';
import 'package:onlinestoreapp/pages/widgets/appbar_widget.dart';

import '../generated/l10n.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final Controller _controller = Get.find();

  late final box;
  late final _favorite;
  Map<int, Color> _favoritemap = HashMap<int, Color>();

  refreshFavorite() {
    _favorite = box.get("favorite");

    if (_favorite == null) {
      _favoritemap = box.put("favorite", HashMap<int, Color>());
    }
  }

  @override
  void initState() {
    box = Hive.box('myBox');
    refreshFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Obx(() =>
          SafeArea(
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                childAspectRatio: 0.52,
                children: _controller.products.value.map((e) {
                  return InkWell(
                      onTap: () {
                        _controller.product.value = e;

                        Get.to(ProductOnePage());
                      },
                      child: Column(
                        children: [
                          // Container(child: Text(_favoritelist[e.id].toString())),
                          Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 3.5,
                              child: Card(
                                // semanticContainer: true,
                                // clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    // side: BorderSide(color: Colors.black12),
                                  ),
                                  elevation: 1,
                                  child: Stack(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(5),

                                          // width: ,
                                          // height: ,
                                          child: e.productImages!.isNotEmpty
                                              ? Image.network(
                                            "${UiO
                                                .url}doc/productimage/download/${e
                                                .productImages!
                                                .firstWhere((element) => element
                                                .mainimg == true, orElse: () =>
                                            e.productImages![0])
                                                .id}",
                                            width: 200,
                                            height: 200,
                                            errorBuilder: (BuildContext context,
                                                Object error,
                                                StackTrace? stackTrace,) {
                                              return Icon(
                                                Icons.photo,
                                                color: Colors.white54,
                                              );
                                            },
                                          )
                                              : Center(
                                            child:
                                            CircularProgressIndicator(),
                                          )),
                                      Container(
                                          alignment: Alignment.topRight,
                                          padding: EdgeInsets.all(5),
                                          child: IconButton(
                                            icon: Icon(
                                              _favoritemap[e.id] == null ||
                                                  _favoritemap[e.id] ==
                                                      Colors.black26 ? Icons
                                                  .favorite_border : Icons
                                                  .favorite,
                                              color: _favoritemap[e.id] == null
                                            ? Colors.black26
                                                : _favoritemap[e.id],
                                            ),
                                            onPressed: () {
                                              _favoritemap.addAll({
                                                e.id!:
                                                _favoritemap[e.id] == null ||
                                                    _favoritemap[e.id] ==
                                                        Colors.black26
                                                    ? Colors.red
                                                    : Colors.black26
                                              });

                                              setState(() {
                                                box.put(
                                                    "favorite", _favoritemap);
                                              });
                                            },
                                          )),
                                    ],
                                  ))),
                          Container(
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 10,
                                top: 5,
                              ),
                              child: Text(
                                e.name.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              )),
                          // Spacer(),

                          Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 20, right: 10),
                                    alignment: Alignment.centerLeft,
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.orange[200],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      e.markuser.toString(),
                                      style: TextStyle(
                                        color: Colors.black26,
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '(${e.marksize.toString()} ${S
                                          .of(context)
                                          .mark})',
                                      style: TextStyle(
                                        color: Colors.black26,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                            child: e.prices!.length > 1
                                ? Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 20, right: 10),
                                child: Text(
                                  '${MainConstant.numberFomat.format(
                                      e.prices![1].pricesum)} ${S
                                      .of(context)
                                      .sum}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black26,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                  textAlign: TextAlign.left,
                                ))
                                : SizedBox(
                              height: 10,
                            ),
                          ),
                          // Spacer(),
                          Container(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(
                                          left: 20, right: 10),
                                      child: Text(
                                          e.prices!.isEmpty
                                              ? ''
                                              : '${MainConstant.numberFomat
                                              .format(
                                              e.prices!.first.pricesum)} ${S
                                              .of(context)
                                              .sum}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis)),
                                  Spacer(),
                                  Container(
                                    // alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(
                                          left: 20, right: 10),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.add_shopping_cart,
                                          // size: 18,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () {},
                                      ))
                                ],
                              ))
                          // Image.network("${UiO.url}")
                        ],
                      ));
                }).toList(),
              ))),
    );
  }
}
