import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/Controller.dart';
import '../generated/l10n.dart';

final Controller _controller = Get.find();

class CharacteristicPage extends StatelessWidget {
  const CharacteristicPage({Key? key}) : super(key: key);

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
            )),
        body: Column(
          children: [
            Container(
              child: Text(
                S.of(context).characteristic,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(10),
                children: _controller.characteristics
                    .map((element) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white70)),
                        child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                height: 50,
                                child: Text(
                                  element.name!,
                                  // style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                              )),
                              VerticalDivider(
                                color: Colors.black,
                              ),
                              Expanded(
                                  child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                      height: 50,
                                      child: Text(
                                        element.valuename!,
                                        style: TextStyle(fontSize: 18),
                                        textAlign: TextAlign.start,
                                      )))
                            ])))
                    .toList(),
              ),
            )
          ],
        ));
  }
}
