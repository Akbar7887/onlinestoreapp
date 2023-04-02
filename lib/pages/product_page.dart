import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:onlinestoreapp/controller/Controller.dart';
import 'package:onlinestoreapp/models/UiO.dart';
import 'package:onlinestoreapp/models/constants/main_constant.dart';
import 'package:onlinestoreapp/models/orders/OrderUser.dart';
import 'package:onlinestoreapp/pages/product_one_page.dart';
import 'package:onlinestoreapp/pages/widgets/appbar_widget.dart';

import '../generated/l10n.dart';
import '../models/catalogs/Product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final Controller _controller = Get.find();
  List<Product> _list = [];

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  final box = Hive.box("myBox");
  var _favoritemap = Map();

  refreshFavorite() {
    if (box.get("favorite") == null) {
      box.put("favorite", HashMap<int, bool>());
    }
    _favoritemap = box.get("favorite");

    if (_controller.pageidx.value == 3) {
      _list = _controller.products.value
          .where((element) => _favoritemap[element.id] == true)
          .toList();
      _controller.products.refresh();
    } else if (_controller.pageidx.value == 1) {
      _list = _controller.products.value
          .where(
              (element) => element.catalog!.id == _controller.catalog.value.id)
          .toList();
    } else {
      _list = _controller.products.value;
    }
  }

  @override
  void initState() {
    // if(_controller.pageidx.value == 3){
    refreshFavorite();
    // }
    // box = Hive.box('myBox');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SafeArea(
          child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        childAspectRatio: 0.51,
        children: _list.map((e) {
          return InkWell(
              onTap: () {
                _controller.product.value = e;
                Get.to(ProductOnePage());
              },
              child: Column(
                children: [
                  _controller.pageidx.value == 3
                      ? Container(child: Text(S.of(context).my_favorite))
                      : SizedBox(),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3.5,
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
                                          "${UiO.url}doc/productimage/download/${e.productImages!.firstWhere((element) => element.mainimg == true, orElse: () => e.productImages![0]).id}",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              3,
                                          errorBuilder: (
                                            BuildContext context,
                                            Object error,
                                            StackTrace? stackTrace,
                                          ) {
                                            return Icon(
                                              Icons.photo,
                                              color: Colors.white54,
                                            );
                                          },
                                        )
                                      : Center(
                                          child: CircularProgressIndicator(),
                                        )),
                              Container(
                                  alignment: Alignment.topRight,
                                  padding: EdgeInsets.all(5),
                                  child: IconButton(
                                    icon: Icon(
                                      _favoritemap[e.id] == null ||
                                              _favoritemap[e.id] == false
                                          ? Icons.favorite_border
                                          : Icons.favorite,
                                      color: _favoritemap[e.id] == null ||
                                              _favoritemap[e.id] == false
                                          ? Colors.black26
                                          : Colors.red,
                                    ),
                                    onPressed: () {
                                      _favoritemap.addAll({
                                        e.id!: _favoritemap[e.id] == null ||
                                                _favoritemap[e.id] == false
                                            ? true
                                            : !_favoritemap[e.id]
                                      });

                                      setState(() {
                                        box.put("favorite", _favoritemap);
                                        refreshFavorite();
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
                        maxLines: 4,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      )),
                  // Spacer(),

                  Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 10),
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
                              '(${e.marksize.toString()} ${S.of(context).mark})',
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
                              '${MainConstant.numberFomat.format(e.prices![0].pricesum)} ${S.of(context).sum}',
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
                              padding: EdgeInsets.only(left: 20, right: 10),
                              child: Text(
                                  e.prices!.isEmpty
                                      ? ''
                                      : '${MainConstant.numberFomat.format(e.prices!.first.pricesum)} ${S.of(context).sum}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis)),
                          Spacer(),
                          Container(
                              // alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 20, right: 10),
                              child: IconButton(
                                icon: Icon(
                                  Icons.add_shopping_cart,
                                  // size: 18,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  OrderUser orderuser = OrderUser();
                                  orderuser.user = _controller.user.value;
                                  orderuser.product = e;
                                  orderuser.price = e.prices![0].price;
                                  orderuser.quantity = 1;
                                  _controller
                                      .save("doc/order/save", orderuser)
                                      .then((value) => _controller.fetchOrder(
                                          _controller.user.value.id
                                              .toString()));
                                },
                              ))
                        ],
                      ))
                  // Image.network("${UiO.url}")
                ],
              ));
        }).toList(),
      )),
    );
  }
}
