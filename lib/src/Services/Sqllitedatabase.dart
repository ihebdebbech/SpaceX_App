import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:firsttest/src/Model/Launche.dart'; // Import your Launch model here

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'notes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE launches (
        flightNumber INTEGER PRIMARY KEY,
        missionName TEXT,
        missionId TEXT, -- Storing as a comma-separated string
        upcoming INTEGER,
        launchYear TEXT,
        launchDateUnix INTEGER,
        launchDateUtc TEXT,
        launchDateLocal TEXT,
        isTentative INTEGER,
        tentativeMaxPrecision TEXT,
        tbd INTEGER,
        launchWindow INTEGER,
        rocketId TEXT,
        rocketName TEXT,
        rocketType TEXT,
        details TEXT,
        staticFireDateUtc TEXT,
        staticFireDateUnix INTEGER,
        launchSuccess INTEGER,
        links TEXT
      )
    ''');
  }

  Future<int> insertLaunch(Launch launch) async {
    Launch2 launch2 = new Launch2();
    Database db = await database;
    return await db.insert(
      'launches',
      launch2.toJson(launch), 
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Launch2>> getLaunches() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('launches');
    return List.generate(maps.length, (i) {
      return Launch2.fromJson(maps[i]);
    });
  }
}

class Launch2 {
  int? flightNumber;
  String? missionName;
  List<String>? missionId;
  bool? upcoming;
  String? launchYear;
  int? launchDateUnix;
  String? launchDateUtc;
  String? launchDateLocal;
  bool? isTentative;
  String? tentativeMaxPrecision;
  bool? tbd;
  int? launchWindow;
  String? rocket;
  String? details;
  String? staticFireDateUtc;
  int? staticFireDateUnix;
  bool? launchSuccess;
  String? links;
 

  Launch2({
    this.flightNumber,
    this.missionName,
    this.missionId,
    this.upcoming,
    this.launchYear,
    this.launchDateUnix,
    this.launchDateUtc,
    this.launchDateLocal,
    this.isTentative,
    this.tentativeMaxPrecision,
    this.tbd,
    this.launchWindow,
    this.rocket,
    this.details,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    this.launchSuccess,
    this.links,
  });

  Launch2.fromJson(Map<String, dynamic> json) {
    flightNumber = json['flightNumber'];
    missionName = json['missionName'];
    missionId = json['missionId'] != null
        ? List<String>.from(json['missionId'].split(','))
        : [];
    upcoming = json['upcoming'] == 1;
    launchYear = json['launchYear'];
    launchDateUnix = json['launchDateUnix'];
    launchDateUtc = json['launchDateUtc'];
    launchDateLocal = json['launchDateLocal'];
    isTentative = json['isTentative'] == 1;
    tentativeMaxPrecision = json['tentativeMaxPrecision'];
    tbd = json['tbd'] == 1;
    launchWindow = json['launchWindow'];
    rocket = json['rocketName'];
    details = json['details'];
    staticFireDateUtc = json['staticFireDateUtc'];
    staticFireDateUnix = json['staticFireDateUnix'];
    launchSuccess = json['launchSuccess'] == 1;
    links = json['links'];
  }
  Map<String, dynamic> toJson(Launch launch) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flightNumber'] = launch.flightNumber;
    data['missionName'] = launch.missionName;
    if (this.missionId != null) {
      data['missionId'] = launch.missionId!.map((v) => v.toString()).toList();
    }
    data['upcoming'] = launch.upcoming;
    data['launchYear'] = launch.launchYear;
    data['launchDateUnix'] = launch.launchDateUnix;
    data['launchDateUtc'] = launch.launchDateUtc;
    data['launchDateLocal'] = launch.launchDateLocal;
    data['isTentative'] = launch.isTentative;
    data['tentativeMaxPrecision'] = launch.tentativeMaxPrecision;
    data['tbd'] = launch.tbd;
    data['launchWindow'] = launch.launchWindow;
    if (launch.rocket != null) {
      data['rocketName'] = launch.rocket!.rocketName.toString();
    }

    data['launchSuccess'] = launch.launchSuccess;

    data['links'] = launch.links!.missionPatchSmall.toString();

    data['details'] = launch.details;
    data['staticFireDateUtc'] = launch.staticFireDateUtc;
    data['staticFireDateUnix'] = launch.staticFireDateUnix;

    return data;
  }
}
