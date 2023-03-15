import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:onlinestoreapp/controller/Controller.dart';
import 'package:onlinestoreapp/models/UiO.dart';
import 'package:onlinestoreapp/pages/widgets/appbar_widget.dart';

final Controller _controller = Get.find();

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Obx(
        () => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: MediaQuery.of(context).size.height / 3.5),
            itemCount: _controller.products.length,
            itemBuilder: (context, idx) {
              return Container(
                // padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Expanded(
                        child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.black12),
                            ),
                            elevation: 0,
                            child: Image.network(
                              "${UiO.url}doc/productimage/download/${_controller.products.value[idx].productImages!.firstWhere((element) => element.mainimg == true).id}",
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
                            ))),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Text(
                            _controller.products.value[idx].name.toString(),
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis))
                    // Image.network("${UiO.url}")
                  ],
                ),
              );
            }),
      ),
    );
  }
}
