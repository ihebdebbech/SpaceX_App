import 'package:carousel_slider/carousel_slider.dart';
import 'package:firsttest/src/Providers/LaunchesProvider.dart';
import 'package:firsttest/src/Providers/MissionsProvider.dart';
import 'package:firsttest/src/Views/SingleMission.dart';
import 'package:firsttest/src/Views/singlelaunch.dart';
import 'package:firsttest/src/sample_feature/loginback.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class MissionsPage extends StatefulWidget {
  const MissionsPage({super.key});

  @override
  State<MissionsPage> createState() => _MissionsPageState();
}

class _MissionsPageState extends State<MissionsPage> {
  final scaffoldState = GlobalKey<ScaffoldState>();
  int _currentIndex=0;

List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: Consumer<MissionsProvider>(
        builder: (context, MissionProvider, _) {
          if ((MissionProvider.isLoading == null) &&
              (MissionProvider.isLoading != true) &&
              MissionProvider.missions.isEmpty) {
            print("inn");
            // Fetch children if they are not already loading and the list is empty
            MissionProvider.getMissions();
          }
          if ((MissionProvider.isLoading != null) &&
              (MissionProvider.isLoading == true)) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Scaffold(
              key: scaffoldState,
              backgroundColor: Color(0x011222),
              body: Stack(
                fit: StackFit.expand,
                children: <Widget>[LoginBackground(),
                 Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    40, 200, 0, 0),
                                            
                                              child:  Text('SpaceX Missions',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold)),
                                            ),
                                          
                     Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 100, 0, 0),
                                            
                                              child:  SizedBox(
                        width: double.infinity,
                        height: 500,
                        child:  CarouselSlider(
 options: CarouselOptions(
  autoPlay: true,
  autoPlayInterval: Duration(seconds: 3),
  autoPlayAnimationDuration: Duration(milliseconds: 800),
  autoPlayCurve: Curves.fastOutSlowIn,
  pauseAutoPlayOnTouch: true,
  aspectRatio: 2.0,

 
 
 ),
  items: MissionProvider.missions.map((mission){
    return Builder(
      builder:(BuildContext context){
        return Container(
          height: MediaQuery.of(context).size.height*0.20,
          width: MediaQuery.of(context).size.width,
          child: Card(
            color: Color.fromARGB(255, 255, 255, 255),
            child: SingleMission(mission:  mission),
          ),
        );
      }
    );
  }).toList(),
),),),],
              ),
            );
          }
        },
      ),
    );
  }
}
