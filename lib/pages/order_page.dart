import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onlinestoreapp/controller/Controller.dart';
import 'package:onlinestoreapp/pages/widgets/appbar_widget.dart';

final Controller _controller = Get.find();

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SafeArea(
        child: Obx(()=>ListView(
          children: _controller.orders.value
              .map((e) => Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    child: Text(e.user!.username!),
                  )))
              .toList(),
        ),
      ),
    ));

  }
}
