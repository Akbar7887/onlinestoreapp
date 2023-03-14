import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class BottomNavigationbar_body extends StatelessWidget {
  const BottomNavigationbar_body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (int i) {
          // if(i == 1){
          //
          //   Get.to(CatalogPage());
          // }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: S.of(context).main),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: S.of(context).seach,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: S.of(context).product,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app_rounded), label: S.of(context).exit)
        ]);
  }
}
