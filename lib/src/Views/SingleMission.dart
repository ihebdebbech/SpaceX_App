import 'package:firsttest/src/Model/Launche.dart';
import 'package:firsttest/src/Model/Mission.dart';
import 'package:flutter/material.dart';

class SingleMission extends StatelessWidget {
  Mission mission;
  SingleMission({super.key, required this.mission});
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
       new SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Text(mission.missionName.toString(),
                style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
          ),
         
           SizedBox(height: 150.0, width: double.infinity, child:Text(mission.description.toString(),
              style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold)),),
        ],
      ),
       ),
    );
  }
}
