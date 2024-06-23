import 'dart:convert';

import 'package:firsttest/src/Model/Launche.dart';
import 'package:firsttest/src/Model/Mission.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class MissionsService {
  static var client = http.Client();
//teestcommit
  Future<List<Mission>> getMissions() async {
    Map<String, String> requestHeaders = {
           'Access-Control-Allow-Origin': '*',
      'CF-RAY': '45845364eeb458df-DFW',
      'Connection': 'keep-alive',
      'Content-Encoding': 'gzip',
      'Content-Type': 'application/json; charset=utf-8',
      'Date': 'Mon, 10 Sep 2018 19:33:21 GMT',
      'Expect-CT': 'max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"',
      'Server': 'cloudflare',
      'Strict-Transport-Security': 'max-age=15552000; includeSubDomains',
      'Transfer-Encoding': 'chunked',
      'Vary': 'Accept-Encoding, Origin',
      'X-Content-Type-Options': 'nosniff',
      'X-DNS-Prefetch-Control': 'off',
      'X-Download-Options': 'noopen',
      'X-Frame-Options': 'SAMEORIGIN',
      'X-Response-Time': '258ms',
      'X-XSS-Protection': '1; mode=block',
    
    
    };

    //var url = Uri.http(Config.apiUrl, Config.reelUrl);http://localhost:9090/api/
    var url = "https://api.spacexdata.com/v3/missions";
    var response = await client.get(Uri.parse(url),headers: requestHeaders);
    print("inn");
    Iterable jsonResponse = json.decode(response.body);
    return jsonResponse.map((mission) => Mission.fromJson(mission)).toList();
    // print(responsedata);
  }
}
