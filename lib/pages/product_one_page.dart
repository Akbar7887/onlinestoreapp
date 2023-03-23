import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onlinestoreapp/controller/Controller.dart';
import 'package:onlinestoreapp/models/constants/main_constant.dart';
import 'package:onlinestoreapp/pages/widgets/appbar_widget.dart';

import '../generated/l10n.dart';
import '../models/UiO.dart';

class ProductOnePage extends StatefulWidget {
  const ProductOnePage({Key? key}) : super(key: key);

  @override
  State<ProductOnePage> createState() => _ProductOnePageState();
}

class _ProductOnePageState extends State<ProductOnePage> {
  final Controller _controller = Get.find();
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Widget getStars() {
    return Container(
        // width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                // color: Colors.red,
                width: MediaQuery.of(context).size.width /
                    _controller.product.value.markuser!.ceil(),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _controller.product.value.markuser!.ceil(),
                    itemBuilder: (context, idx) {
                      return Icon(
                        Icons.star,
                        color: Colors.orange[200],
                        size: 30,
                      );
                    })),
            SizedBox(width: 10),
            Container(
              // alignment: Alignment.centerLeft,
              child: Text(
                _controller.product.value.markuser.toString(),
                style: TextStyle(
                  color: Colors.black26,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              // alignment: Alignment.centerLeft,
              child: Text(
                '(${_controller.product.value.marksize.toString()} ${S.of(context).mark})',
                style: TextStyle(
                  color: Colors.black26,
                ),
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                            child: PageView.builder(
                          controller: _pageController,
                          itemCount:
                              _controller.product.value.productImages!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                alignment: Alignment.center,
                                child: Image.network(
                                  "${UiO.url}doc/productimage/download/${_controller.product.value.productImages![index].id}",
                                  // color: Colors.transparent,
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
                                ));
                          },
                          onPageChanged: (int index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                        )),
                        Container(
                            height: 30,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              '${_currentPage + 1}/${_controller.product.value.productImages!.length}',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(_controller.product.value.name!,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 50,
                  child: getStars()),

              Container(
                child: _controller.product.value.prices!.length > 1
                    ? Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Text(
                          '${MainConstant.numberFomat.format(_controller.product.value.prices![1].pricesum)} ${S.of(context).sum}',
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
                  padding: EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                      '${MainConstant.numberFomat.format(_controller.product.value.prices!.first.pricesum)} ${S.of(context).sum}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis)),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Icon(Icons.question_mark),
                      SizedBox(width: 20),
                      Text(S.of(context).description_goods,
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left)
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(_controller.product.value.description!,
                      style:
                          TextStyle(fontSize: 18),
                      textAlign: TextAlign.justify,
                      ))

              // Image
            ],
          ),
        ));
  }
}
