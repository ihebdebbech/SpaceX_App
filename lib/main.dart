import 'dart:io';

import 'package:firsttest/src/Providers/LaunchesProvider.dart';
import 'package:firsttest/src/Providers/MissionsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
HttpOverrides.global = MyHttpOverrides();
 runApp(
    MaterialApp(
      // Provide necessary configurations here, such as theme, localizations, etc.
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LaunchesProvider()),
                ChangeNotifierProvider(create: (context) => MissionsProvider()),
       ],
        child: MyApp(),
      ),
    ),
  );}
