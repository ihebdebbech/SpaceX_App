import 'package:firsttest/src/Model/Launche.dart';
import 'package:firsttest/src/Services/Sqllitedatabase.dart';
import 'package:flutter/material.dart';

class SingleLaunch extends StatelessWidget {
  final Launch? launch;
  final Launch2? launch2;

  SingleLaunch({Key? key, this.launch, this.launch2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          if (launch != null) ...[
            SizedBox(width: 8),
            Image.network(
              launch!.links!.missionPatchSmall ?? 'https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png',
              height: 100,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Text(
                    launch!.missionName.toString() ?? 'https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      launch!.rocket!.rocketName.toString() ?? 'https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      launch!.launchYear.toString() ?? 'https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ] else ...[
            // Widget to display when launch is null
            SizedBox(width: 8),
            launch2!.links != null ?
            Image.network(
              launch2!.links! ?? 'https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png',
              height: 100,
              fit: BoxFit.fill,
            ) : Container() ,
            SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Text(
                    launch2!.missionName.toString() ?? 'https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      launch2!.rocket.toString() ?? 'https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      launch2!.launchYear.toString() ?? 'https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
