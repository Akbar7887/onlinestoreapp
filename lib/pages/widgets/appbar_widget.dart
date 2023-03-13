import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

TextEditingController _seachController = TextEditingController();

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => throw UnimplementedError();

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: TextField(
          controller: _seachController,
          decoration: InputDecoration(
              labelText: S.of(context).seach_product,
              hintText: S.of(context).seach_product,
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0))))),
    ));
  }
}
