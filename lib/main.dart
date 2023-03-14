import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:onlinestoreapp/pages/catalog_page.dart';
import 'package:onlinestoreapp/pages/directionality_page.dart';
import 'package:onlinestoreapp/pages/home.dart';

import 'controller/Controller.dart';
import 'generated/l10n.dart';
import 'models/UiO.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: UiO.companyName,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      // supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        textTheme: TextTheme(),
        fontFamily: UiO.font,
        appBarTheme: AppBarTheme(color: Colors.white),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.white),

        // textTheme: TextTheme(bodyText1: ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //primarySwatch: Colors.black87,
      ),
      initialRoute: '/',
       initialBinding: HomeBindings(),
      getPages: [
        GetPage(name: '/', page: () => DirectionalityPage()),
        GetPage(name: '/catalog', page: () => CatalogPage()),
      ],
    );
  }
}
