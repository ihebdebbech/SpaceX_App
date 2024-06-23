// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firsttest/src/Model/Launche.dart';
import 'package:firsttest/src/Providers/LaunchesProvider.dart';
import 'package:firsttest/src/Services/Sqllitedatabase.dart';
import 'package:firsttest/src/Views/launchdetailpopup.dart';
import 'package:firsttest/src/Views/singlelaunch.dart';
import 'package:firsttest/src/sample_feature/loginback.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';



class LaunchesPage extends StatefulWidget {
  const LaunchesPage({super.key});

  @override
  State<LaunchesPage> createState() => _LaunchesPageState();
}

class _LaunchesPageState extends State<LaunchesPage> {
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  final scaffoldState = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  late List<Launch2> launch2s;

  @override
  void initState() {
    dbHelper.database;
    refreshlaunch();
    super.initState();
  }

  @override
  dispose() {
    /// dbHelper.close();
    super.dispose();
  }

  refreshlaunch() {
    dbHelper.getLaunches().then((value) {
      setState(() {
        launch2s = value;
        print(launch2s[0].missionName);
      });
    });
  }
final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: Consumer<LaunchesProvider>(
        builder: (context, launchProvider, _) {
          if ((launchProvider.isLoading == null) &&
              (launchProvider.isLoading != true) &&
              launchProvider.launches.isEmpty) {
            print("inn");
            // Fetch children if they are not already loading and the list is empty
           launchProvider.getlaunches();
         // launchProvider.getlauncheslocal();
          }
          if ((launchProvider.isLoading != null) &&
              (launchProvider.isLoading == true)) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Scaffold(
              key: scaffoldState,
              backgroundColor: Color(0x011222),
              body: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  LoginBackground(),
                  
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 200, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 400,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          pauseAutoPlayOnTouch: true,
                          aspectRatio: 2.0,
                        ),
                        items: launchProvider.launchessearched.map((launch) {
                          return Builder(builder: (BuildContext context) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.30,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: GestureDetector(
                                  child: SingleLaunch(launch: launch),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return LaunchDetailPopup(
                                            launch: launch);
                                      },
                                    );
                                    print(launch.missionName?.toString());
                                  },
                                ),
                              ),
                            );
                          });
                        }).toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 200, 0, 0),
                    child: Column(children: [ Text('SpaceX Launches',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold)),
                            SizedBox(height: 10,),
                        TextField(
  controller: _controller,
  decoration: InputDecoration(
    
    filled: true, // Make sure this is set to true
    fillColor: Colors.white, // Set the fill color to white
    labelText: 'Enter element to search',
    border: OutlineInputBorder(), // Optional: Adds a border to the text field
  ),
),
SizedBox(height: 10,),
               ElevatedButton( 
                
              onPressed: ()=> launchProvider.findlaunches(_controller.text.toString()),
              child: Text('Search'),
            ), ], ),
                            
                  ),
                  
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
