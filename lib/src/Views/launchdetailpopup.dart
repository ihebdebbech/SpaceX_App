import 'package:firsttest/src/Model/Launche.dart';
import 'package:flutter/material.dart';

class LaunchDetailPopup extends StatelessWidget {
  final Launch? launch;

  LaunchDetailPopup({super.key, this.launch});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Launch Details',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          if (launch != null) ...[
            Text(
              'Mission Name: ${launch!.missionName}',
              style: TextStyle(fontSize: 18),
            ),
                    Text(
  'Launch status: ${launch!.launchSuccess == true ? 'Success' : 'Fail'}',
  style: TextStyle(fontSize: 18),
),
            SizedBox(height: 10),
            Text(
              'Rocket Name: ${launch!.rocket!.rocketName}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Launch Year: ${launch!.launchYear}',
              style: TextStyle(fontSize: 18),
            ),
    
Text(
  'Launch site: ${launch!.launchSite!.siteName! }',
  style: TextStyle(fontSize: 18),
),
          ] else
            Text(
              'Launch details not available.',
              style: TextStyle(fontSize: 18),
            ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); 
            },
            child: Text(
              'Close',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}


