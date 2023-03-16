import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:onlinestoreapp/controller/Controller.dart';
import 'package:onlinestoreapp/models/UiO.dart';
import 'package:onlinestoreapp/pages/widgets/appbar_widget.dart';

import '../generated/l10n.dart';

final Controller _controller = Get.find();
final numberFomat = new NumberFormat("#,##0", "uz");

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Obx(() => SafeArea(
              child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            childAspectRatio: 0.6,
            children: _controller.products.value
                .map((e) => Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height /
                                3.7,
                            child: Card(
                                // semanticContainer: true,
                                // clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  // side: BorderSide(color: Colors.black12),
                                ),
                                elevation: 1,
                                child: Container(
                                    margin: EdgeInsets.all(50),

                                    // width: ,
                                    // height: ,
                                    child: Image.network(
                                      "${UiO.url}doc/productimage/download/${e.productImages!.firstWhere((element) => element.mainimg == true).id}",
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height:
                                          MediaQuery.of(context).size.height /
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
                                    )))),
                        Container(
                            // flex: 1,
                            child: Container(
                                padding: EdgeInsets.only(left: 20, right: 10),
                                child: Text(
                                  e.name.toString(),
                                  style: TextStyle(fontSize: 12),
                                  textAlign: TextAlign.left,
                                ))),
                        // SizedBox(
                        //   height: 10,
                        // ),

                        Container(
                            child: Column(
                          children: [
                            e.prices!.length > 1
                                ? Container(
                                    alignment: Alignment.centerLeft,
                                    padding:
                                        EdgeInsets.only(left: 20, right: 10),
                                    child: Text(
                                      '${numberFomat.format(e.prices![1].pricesum)} ${S.of(context).sum}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black26,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                      textAlign: TextAlign.left,
                                    ))
                                : SizedBox(
                                    height: 20,
                                  ),
                            Container(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    // alignment: Alignment.centerLeft,
                                    padding:
                                        EdgeInsets.only(left: 20, right: 10),
                                    child: Text(
                                        '${numberFomat.format(e.prices!.first.pricesum)} ${S.of(context).sum}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis)),
                                Spacer(),
                                Container(
                                    // alignment: Alignment.centerLeft,
                                    padding:
                                        EdgeInsets.only(left: 20, right: 10),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.add_shopping_cart,
                                        size: 18,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {},
                                    ))
                              ],
                            ))
                          ],
                        ))
                        // Image.network("${UiO.url}")
                      ],
                    ))
                .toList(),
          ))),
    );
  }
}
