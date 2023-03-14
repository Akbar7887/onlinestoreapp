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
                child: Column(
                  children: [
                    Expanded(
                        child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.white),
                            ),
                            elevation: 0,
                            child: Container())),
                    Container(child: Text("ok"))
                    // Image.network("${UiO.url}")
                  ],
                ),
              );
            }),
      ),
    );
  }
}
