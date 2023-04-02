import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinestoreapp/controller/Controller.dart';
import 'package:onlinestoreapp/pages/widgets/appbar_widget.dart';

import '../generated/l10n.dart';
import '../models/UiO.dart';
import '../models/constants/main_constant.dart';

final Controller _controller = Get.find();

class OrderPage extends GetView<Controller> {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBarWidget(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: _controller.orders.value
                  .map((e) => Container(
                      height: MediaQuery.of(context).size.height / 7,
                      // margin: EdgeInsets.all(5),
                      child: Card(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      child:
                                          e.product!.productImages!.isNotEmpty
                                              ? Image.network(
                                                  "${UiO.url}doc/productimage/download/${e.product!.productImages!.firstWhere((element) => element.mainimg == true, orElse: () => e.product!.productImages![0]).id}",

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
                                                  child:
                                                      CircularProgressIndicator(),
                                                )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.1,
                                                child: Text(
                                                  e.product!.name!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  maxLines: 4,
                                                  // style: TextStyle(
                                                  //   fontSize: 14,
                                                  //   color: Colors.black26,
                                                  //   decoration: TextDecoration.lineThrough,
                                                  // ),
                                                ),
                                              ),
                                              // Spacer(),
                                              Container(
                                                  child: IconButton(
                                                icon: Icon(Icons.more_vert),
                                                onPressed: () =>
                                                    showModalBottomSheet<void>(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Container(
                                                      padding:
                                                          EdgeInsets.all(40),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        // mainAxisAlignment:
                                                        //     MainAxisAlignment
                                                        //         .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            child:
                                                                TextButton.icon(
                                                                    onPressed:
                                                                        () {},
                                                                    icon: Icon(Icons
                                                                        .favorite_border),
                                                                    label: Text(
                                                                      S
                                                                          .of(context)
                                                                          .favorite_survive,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20),
                                                                    )),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Container(
                                                              child: TextButton
                                                                  .icon(
                                                                      onPressed:
                                                                          () {
                                                                        _controller
                                                                            .deleteById("doc/order/",
                                                                                e.id.toString())
                                                                            .then((value)
                                                                        {
                                                                          _controller.orders.value.remove(e);

                                                                        }
                                                                        );
                                                                      },
                                                                      icon: Icon(
                                                                          Icons
                                                                              .delete_forever_outlined),
                                                                      label:
                                                                          Text(
                                                                        S
                                                                            .of(context)
                                                                            .delete,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20),
                                                                      ))),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ))
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                            alignment: Alignment.bottomLeft,
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: Text(
                                                    '${S.of(context).count} ${e.quantity.toString()}',
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                ),
                                                Container(
                                                  child: IconButton(
                                                    icon: Icon(Icons
                                                        .keyboard_arrow_down_sharp),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                  // alignment: Alignment.centerLeft,
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              20,
                                                                          right:
                                                                              10),
                                                                  child: Text(
                                                                      e.product!.prices!
                                                                              .isEmpty
                                                                          ? ''
                                                                          : '${MainConstant.numberFomat.format(e.product!.prices!.first.pricesum)} ${S.of(context).sum}',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis)),
                                                            ],
                                                          )),
                                                      Container(
                                                        child: e
                                                                    .product!
                                                                    .prices!
                                                                    .length >
                                                                1
                                                            ? Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            10),
                                                                child: Text(
                                                                  '${MainConstant.numberFomat.format(e.product!.prices![0].pricesum)} ${S.of(context).sum}',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black26,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                ))
                                                            : SizedBox(
                                                                height: 10,
                                                              ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              )))))
                  .toList(),
            ),
          ),
        )));
  }
}
