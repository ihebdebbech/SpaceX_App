import 'package:firsttest/src/Views/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';



/// The Widget that configures your application.
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   @override
  void initState() {
    super.initState();
  }
    @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    

      title: 'Space X',
      home: HomePage(),
      debugShowCheckedModeBanner: false, // Replace with your desired URL
    );
  }
  
}
