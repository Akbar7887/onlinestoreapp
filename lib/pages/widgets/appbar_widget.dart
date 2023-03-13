import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget with PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {


  // TextEditingController _seachController = TextEditingController();
  String? searchValue;

  @override
  Widget build(BuildContext context) {
    return EasySearchBar(
        iconTheme: IconThemeData(color: Colors.black38),
        title: Text("wgf"),
        onSearch: (value) {
          setState(() {
            searchValue = value;
          });
        },
    );
  }
}
