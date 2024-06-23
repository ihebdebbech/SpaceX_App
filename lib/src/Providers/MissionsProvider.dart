// child_provider.dart
// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'dart:collection';

import 'package:firsttest/src/Model/Launche.dart';
import 'package:firsttest/src/Model/Mission.dart';
import 'package:firsttest/src/Services/MissionsService.dart';
import 'package:firsttest/src/Services/launchesService.dart';
import 'package:flutter/material.dart';
// Import your ChildService

class MissionsProvider extends ChangeNotifier {
  List<Mission> missions = [];
  bool? isLoading = null;
  MissionsService missionsService = MissionsService() ;

  Future<void> getMissions() async {
    missions = await missionsService.getMissions();
    print(missions[0].toString());
    isLoading = false;
    notifyListeners();
  }
}
