// child_provider.dart
// ignore_for_file: unused_local_variable

import 'dart:collection';

import 'package:firsttest/src/Model/Launche.dart';
import 'package:firsttest/src/Services/Sqllitedatabase.dart';
import 'package:firsttest/src/Services/launchesService.dart';
import 'package:flutter/material.dart';
// Import your ChildService

class LaunchesProvider extends ChangeNotifier {
  List<Launch> launches = [];
  List<Launch2> launches2 = [];
  List<Launch> launchessearched = [];
  List<Launch2> launchessearched2 = [];
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  bool? isLoading = null;
  LaunchService launchService = LaunchService();

  Future<void> getlaunches() async {
    launches = await launchService.getLaunches();
    launchessearched = launches;
    isLoading = false;

    // Loop through launches and insert each one sequentially
    for (var launch in launches) {
      await dbHelper.insertLaunch(launch);
      print("Adding launch: ${launch.missionName}");
    }

    notifyListeners();
  }

  Future<void> getlauncheslocal() async {
    launches2 = await dbHelper.getLaunches();
    launchessearched2 = launches2;
    isLoading = false;
    
    // Loop through launches and insert each one sequentially

    notifyListeners();
  }

  void findlaunches(String missionname) {
    try {
      var foundLaunch = launches.firstWhere(
        (launch) =>
            launch.missionName?.toLowerCase() == missionname.toLowerCase(),
        // Provide a default value
      );

      if (foundLaunch == null) {
        launchessearched = launches;
      } else {
        launchessearched = [foundLaunch];
      }
    } catch (e) {
      // If there's an error, revert to the full list
      launchessearched = launches;
    }

    notifyListeners();
  }
}
