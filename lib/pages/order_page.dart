import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onlinestoreapp/controller/Controller.dart';
import 'package:onlinestoreapp/pages/widgets/appbar_widget.dart';

import '../generated/l10n.dart';
import '../models/UiO.dart';

final Controller _controller = Get.find();

class OrderPage extends GetView<Controller> {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: _controller.orders.value
                  .map((e) => Container(
                      // margin: EdgeInsets.all(5),
                      child: Card(
                          child: Container(
                              margin: EdgeInsets.all(10),
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
                                                  // width: MediaQuery.of(context)
                                                  //         .size
                                                  //         .width /
                                                  //     5,
                                                  // height: MediaQuery.of(context)
                                                  //         .size
                                                  //         .height /
                                                  //     5,
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
                                      children: [
                                        Container(
                                          child: Text(
                                            e.product!.name!,
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
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
        ));
  }
}
