// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:firsttest/src/Providers/LaunchesProvider.dart';
import 'package:firsttest/src/Views/LaunchesPage.dart';
import 'package:firsttest/src/Views/missionsPage.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool _showUpdatePasswordPopup = true;

  bool isLoading = true;
  // Initially true to show the popup

  @override
  initState() {
    super.initState();
  }
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
   LaunchesPage(),
    MissionsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double menuWidth = screenWidth * 0.35;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Launches',

          ),
        
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            
            label: 'Missions',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Color.fromARGB(255, 255, 255, 255) ,
        unselectedItemColor:Color.fromARGB(255, 118, 118, 118), 
        selectedItemColor: Color.fromARGB(255, 1, 19, 32),
        onTap: _onItemTapped,
      ),
      body: Consumer<LaunchesProvider>(
        builder: (context, provider, _) {
          // Display loading indicator while loading
          if ((provider.isLoading != null) && (provider.isLoading == true)) {
            return Center(
            //  child: CircularProgressIndicator(),
            );
          } else {
            return SafeArea(
              top: false,
              child:  _widgetOptions.elementAt(_selectedIndex),
              /* Stack(
                children: [
                      NotificationWidget(),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            left: notificationprovider.isMenuOpen
                                ? 0
                                : screenWidth - menuWidth,
                            child: SizedBox(
                              width: screenWidth,
                              height: screenHeight,
                              child: _pages[provider.selectedIndex],
                            ),
                          ),
                ],
              ),*/
            );
          }
          
        },
      ),
    );
  }
}
