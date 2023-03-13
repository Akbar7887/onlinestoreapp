import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinestoreapp/pages/widgets/appbar_widget.dart';
import 'package:onlinestoreapp/pages/widgets/bottomnavigationbar_body.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
        body: Container(
      child: Text(
        "Home",
      ),
    ));
  }
}
