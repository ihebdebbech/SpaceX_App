// ignore_for_file: unnecessary_new, unnecessary_this
import 'dart:convert';
import 'dart:ffi';

import 'package:get/get_connect/http/src/request/request.dart';

class Launch {
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
  Rocket? rocket;
  List<String>? ships;
  Telemetry? telemetry;
  LaunchSite? launchSite;
  bool? launchSuccess;
  LaunchFailureDetails? launchFailureDetails;
  Links? links;
  String? details;
  String? staticFireDateUtc;
  int? staticFireDateUnix;
  Timeline? timeline;

  Launch(
      {this.flightNumber,
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
      this.ships,
      this.telemetry,
      this.launchSite,
      this.launchSuccess,
      this.launchFailureDetails,
      this.links,
      this.details,
      this.staticFireDateUtc,
      this.staticFireDateUnix,
      this.timeline});

  Launch.fromJson(Map<String, dynamic> json) {
    flightNumber = json['flight_number'];
    missionName = json['mission_name'];
    missionId =
        json['mission_id'] != null ? List<String>.from(json['mission_id']) : [];
    upcoming = json['upcoming'];
    launchYear = json['launch_year'];
    launchDateUnix = json['launch_date_unix'];
    launchDateUtc = json['launch_date_utc'];
    launchDateLocal = json['launch_date_local'];
    isTentative = json['is_tentative'];
    tentativeMaxPrecision = json['tentative_max_precision'];
    tbd = json['tbd'];
    launchWindow = json['launch_window'];
    rocket =
        json['rocket'] != null ? new Rocket.fromJson(json['rocket']) : null;

    ships = json['ships'] != null ? List<String>.from(json['ships']) : [];
    telemetry = json['telemetry'] != null
        ? new Telemetry.fromJson(json['telemetry'])
        : null;
    launchSite = json['launch_site'] != null
        ? new LaunchSite.fromJson(json['launch_site'])
        : null;
    launchSuccess = json['launch_success'];
    launchFailureDetails = json['launch_failure_details'] != null
        ? new LaunchFailureDetails.fromJson(json['launch_failure_details'])
        : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    details = json['details'];
    staticFireDateUtc = json['static_fire_date_utc'];
    staticFireDateUnix = json['static_fire_date_unix'];
    timeline = json['timeline'] != null
        ? new Timeline.fromJson(json['timeline'])
        : null;
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flight_number'] = this.flightNumber;
    data['mission_name'] = this.missionName;
    if (this.missionId != null) {
      data['mission_id'] = this.missionId!.map((v) => v.toString()).toList();
    }
    data['upcoming'] = this.upcoming;
    data['launch_year'] = this.launchYear;
    data['launch_date_unix'] = this.launchDateUnix;
    data['launch_date_utc'] = this.launchDateUtc;
    data['launch_date_local'] = this.launchDateLocal;
    data['is_tentative'] = this.isTentative;
    data['tentative_max_precision'] = this.tentativeMaxPrecision;
    data['tbd'] = this.tbd;
    data['launch_window'] = this.launchWindow;
    if (this.rocket != null) {
      data['rocket'] = this.rocket!.toJson();
    }
    if (this.ships != null) {
      data['ships'] = this.ships!.map((v) => v.toString()).toList();
    }
    if (this.telemetry != null) {
      data['telemetry'] = this.telemetry!.toJson();
    }
    if (this.launchSite != null) {
      data['launch_site'] = this.launchSite!.toJson();
    }
    data['launch_success'] = this.launchSuccess;
    if (this.launchFailureDetails != null) {
      data['launch_failure_details'] = this.launchFailureDetails!.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    data['details'] = this.details;
    data['static_fire_date_utc'] = this.staticFireDateUtc;
    data['static_fire_date_unix'] = this.staticFireDateUnix;
    if (this.timeline != null) {
      data['timeline'] = this.timeline!.toJson();
    }
    return data;
  }
  @override
  String toString() {
    return 'Launch(flightNumber: $flightNumber, missionName: $missionName, missionId: $missionId, upcoming: $upcoming, launchYear: $launchYear, launchDateUnix: $launchDateUnix, launchDateUtc: $launchDateUtc, launchDateLocal: $launchDateLocal, isTentative: $isTentative, tentativeMaxPrecision: $tentativeMaxPrecision, tbd: $tbd, launchWindow: $launchWindow, rocket: $rocket, ships: $ships, telemetry: $telemetry, launchSite: $launchSite, launchSuccess: $launchSuccess, launchFailureDetails: $launchFailureDetails, links: $links, details: $details, staticFireDateUtc: $staticFireDateUtc, staticFireDateUnix: $staticFireDateUnix, timeline: $timeline)';
  }
}

class Rocket {
  String? rocketId;
  String? rocketName;
  String? rocketType;
  FirstStage? firstStage;
  SecondStage? secondStage;
  Fairings? fairings;

  Rocket(
      {this.rocketId,
      this.rocketName,
      this.rocketType,
      this.firstStage,
      this.secondStage,
      this.fairings});

  Rocket.fromJson(Map<String, dynamic> json) {
    rocketId = json['rocket_id'];
    rocketName = json['rocket_name'];
    rocketType = json['rocket_type'];
    firstStage = json['first_stage'] != null
        ? new FirstStage.fromJson(json['first_stage'])
        : null;
    secondStage = json['second_stage'] != null
        ? new SecondStage.fromJson(json['second_stage'])
        : null;
    fairings = json['fairings'] != null
        ? new Fairings.fromJson(json['fairings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rocket_id'] = this.rocketId;
    data['rocket_name'] = this.rocketName;
    data['rocket_type'] = this.rocketType;
    if (this.firstStage != null) {
      data['first_stage'] = this.firstStage!.toJson();
    }
    if (this.secondStage != null) {
      data['second_stage'] = this.secondStage!.toJson();
    }
    if (this.fairings != null) {
      data['fairings'] = this.fairings!.toJson();
    }
    return data;
  }
  @override
  String toString() {
    return 'Launch(rocket_id: $rocketId, rocket_name: $rocketName, rocket_type: $rocketType, first_stage: $firstStage, fairings: $fairings)';
  }
}

class FirstStage {
  List<Cores>? cores;

  FirstStage({this.cores});

  FirstStage.fromJson(Map<String, dynamic> json) {
    if (json['cores'] != null) {
      cores = <Cores>[];
      json['cores'].forEach((v) {
        cores!.add(new Cores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cores != null) {
      data['cores'] = this.cores!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cores {
  String? coreSerial;
  int? flight;
  int? block;
  bool? gridfins;
  bool? legs;
  bool? reused;
  bool? landSuccess;
  bool? landingIntent;
  String? landingType;
  String? landingVehicle;

  Cores(
      {this.coreSerial,
      this.flight,
      this.block,
      this.gridfins,
      this.legs,
      this.reused,
      this.landSuccess,
      this.landingIntent,
      this.landingType,
      this.landingVehicle});

  Cores.fromJson(Map<String, dynamic> json) {
    coreSerial = json['core_serial'];
    flight = json['flight'];
    block = json['block'];
    gridfins = json['gridfins'];
    legs = json['legs'];
    reused = json['reused'];
    landSuccess = json['land_success'];
    landingIntent = json['landing_intent'];
    landingType = json['landing_type'];
    landingVehicle = json['landing_vehicle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['core_serial'] = this.coreSerial;
    data['flight'] = this.flight;
    data['block'] = this.block;
    data['gridfins'] = this.gridfins;
    data['legs'] = this.legs;
    data['reused'] = this.reused;
    data['land_success'] = this.landSuccess;
    data['landing_intent'] = this.landingIntent;
    data['landing_type'] = this.landingType;
    data['landing_vehicle'] = this.landingVehicle;
    return data;
  }
}

class SecondStage {
  int? block;
  List<Payloads>? payloads;

  SecondStage({this.block, this.payloads});

  SecondStage.fromJson(Map<String, dynamic> json) {
    block = json['block'];
    if (json['payloads'] != null) {
      payloads = <Payloads>[];
      json['payloads'].forEach((v) {
        payloads!.add(new Payloads.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['block'] = this.block;
    if (this.payloads != null) {
      data['payloads'] = this.payloads!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payloads {
  String? payloadId;
  List<int>? noradId;
  bool? reused;
  List<String>? customers;
  String? nationality;
  String? manufacturer;
  String? payloadType;
  int? payloadMassKg;
  int? payloadMassLbs;
  String? orbit;
  OrbitParams? orbitParams;

  Payloads(
      {this.payloadId,
      this.noradId,
      this.reused,
      this.customers,
      this.nationality,
      this.manufacturer,
      this.payloadType,
      this.payloadMassKg,
      this.payloadMassLbs,
      this.orbit,
      this.orbitParams});

  Payloads.fromJson(Map<String, dynamic> json) {
    payloadId = json['payload_id'];
    if (json['norad_id'] != null) {
      noradId =
          json['norad_id'] != null ? List<int>.from(json['norad_id']) : [];
    }
    reused = json['reused'];
    customers =
        json['customers'] != null ? List<String>.from(json['customers']) : [];
    nationality = json['nationality'];
    manufacturer = json['manufacturer'];
    payloadType = json['payload_type'];
    //payloadMassKg = json['payload_mass_kg'];
    //payloadMassLbs = json['payload_mass_lbs'];
    orbit = json['orbit'];
    orbitParams = json['orbit_params'] != null
        ? new OrbitParams.fromJson(json['orbit_params'])
        : null;
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payload_id'] = this.payloadId;
    if (this.noradId != null) {
      data['norad_id'] = this.noradId!.map((v) => v.toString()).toList();
    }
    data['reused'] = this.reused;
    data['customers'] = this.customers;
    data['nationality'] = this.nationality;
    data['manufacturer'] = this.manufacturer;
    data['payload_type'] = this.payloadType;
    data['payload_mass_kg'] = this.payloadMassKg;
    data['payload_mass_lbs'] = this.payloadMassLbs;
    data['orbit'] = this.orbit;
    if (this.orbitParams != null) {
      data['orbit_params'] = this.orbitParams!.toJson();
    }
    return data;
  }
}

class OrbitParams {
  String? referenceSystem;
  String? regime;
  double? longitude;
  double? semiMajorAxisKm;
  double? eccentricity;
  int? periapsisKm;
  int? apoapsisKm;
  int? inclinationDeg;
  double? periodMin;
  int? lifespanYears;
  late String? epoch;
  double? meanMotion;
  double? raan;
  double? argOfPericenter;
  double? meanAnomaly;

  OrbitParams(
      {this.referenceSystem,
      this.regime,
      this.longitude,
      this.semiMajorAxisKm,
      this.eccentricity,
      this.periapsisKm,
      this.apoapsisKm,
      this.inclinationDeg,
      this.periodMin,
      this.lifespanYears,
      required this.epoch,
      this.meanMotion,
      this.raan,
      this.argOfPericenter,
      this.meanAnomaly});

  OrbitParams.fromJson(Map<String, dynamic> json) {
    referenceSystem = json['reference_system'];
    regime = json['regime'];
    //longitude =json['longitude'] != null ?  double.parse(json['longitude']) :  null;
    semiMajorAxisKm = json['semi_major_axis_km'];
    eccentricity = json['eccentricity'];
    //periapsisKm = json['periapsis_km'];
    // apoapsisKm = json['apoapsis_km'];
    //  inclinationDeg = json['inclination_deg'];
    periodMin = json['period_min'];
    //lifespanYears = json['lifespan_years'];
    epoch = json['epoch'];
    meanMotion = json['mean_motion'];
    raan = json['raan'];
    argOfPericenter = json['arg_of_pericenter'];
    meanAnomaly = json['mean_anomaly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference_system'] = this.referenceSystem;
    data['regime'] = this.regime;
    data['longitude'] = this.longitude;
    data['semi_major_axis_km'] = this.semiMajorAxisKm;
    data['eccentricity'] = this.eccentricity;
    data['periapsis_km'] = this.periapsisKm;
    data['apoapsis_km'] = this.apoapsisKm;
    data['inclination_deg'] = this.inclinationDeg;
    data['period_min'] = this.periodMin;
    data['lifespan_years'] = this.lifespanYears;
    data['epoch'] = this.epoch;
    data['mean_motion'] = this.meanMotion;
    data['raan'] = this.raan;
    data['arg_of_pericenter'] = this.argOfPericenter;
    data['mean_anomaly'] = this.meanAnomaly;
    return data;
  }
}

class Fairings {
  bool? reused;
  bool? recoveryAttempt;
  bool? recovered;
  String? ship;

  Fairings({this.reused, this.recoveryAttempt, this.recovered, this.ship});

  Fairings.fromJson(Map<String, dynamic> json) {
    reused = json['reused'];
    recoveryAttempt = json['recovery_attempt'];
    recovered = json['recovered'];
    ship = json['ship'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reused'] = this.reused;
    data['recovery_attempt'] = this.recoveryAttempt;
    data['recovered'] = this.recovered;
    data['ship'] = this.ship;
    return data;
  }
}

class Telemetry {
  String? flightClub;

  Telemetry({this.flightClub});

  Telemetry.fromJson(Map<String, dynamic> json) {
    flightClub = json['flight_club'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flight_club'] = this.flightClub;
    return data;
  }
}

class LaunchSite {
  String? siteId;
  String? siteName;
  String? siteNameLong;

  LaunchSite({this.siteId, this.siteName, this.siteNameLong});

  LaunchSite.fromJson(Map<String, dynamic> json) {
    siteId = json['site_id'];
    siteName = json['site_name'];
    siteNameLong = json['site_name_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['site_id'] = this.siteId;
    data['site_name'] = this.siteName;
    data['site_name_long'] = this.siteNameLong;
    return data;
  }
}

class LaunchFailureDetails {
  int? time;
  int? altitude;
  String? reason;

  LaunchFailureDetails({this.time, this.altitude, this.reason});

  LaunchFailureDetails.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    altitude = json['altitude'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['altitude'] = this.altitude;
    data['reason'] = this.reason;
    return data;
  }
}

class Links {
  String? missionPatch;
  String? missionPatchSmall;
  String? redditCampaign;
  String? redditLaunch;
  String? redditRecovery;
  String? redditMedia;
  String? presskit;
  String? articleLink;
  String? wikipedia;
  String? videoLink;
  String? youtubeId;
  List<String>? flickrImages;

  Links(
      {this.missionPatch,
      this.missionPatchSmall,
      this.redditCampaign,
      this.redditLaunch,
      this.redditRecovery,
      this.redditMedia,
      this.presskit,
      this.articleLink,
      this.wikipedia,
      this.videoLink,
      this.youtubeId,
      this.flickrImages});

  Links.fromJson(Map<String, dynamic> json) {
    missionPatch = json['mission_patch'];
    missionPatchSmall = json['mission_patch_small'];
    redditCampaign = json['reddit_campaign'];
    redditLaunch = json['reddit_launch'];
    redditRecovery = json['reddit_recovery'];
    redditMedia = json['reddit_media'];
    presskit = json['presskit'];
    articleLink = json['article_link'];
    wikipedia = json['wikipedia'];
    videoLink = json['video_link'];
    youtubeId = json['youtube_id'];
    flickrImages = json['flickr_images'] != null
        ? List<String>.from(json['flickr_images'])
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mission_patch'] = this.missionPatch;
    data['mission_patch_small'] = this.missionPatchSmall;
    data['reddit_campaign'] = this.redditCampaign;
    data['reddit_launch'] = this.redditLaunch;
    data['reddit_recovery'] = this.redditRecovery;
    data['reddit_media'] = this.redditMedia;
    data['presskit'] = this.presskit;
    data['article_link'] = this.articleLink;
    data['wikipedia'] = this.wikipedia;
    data['video_link'] = this.videoLink;
    data['youtube_id'] = this.youtubeId;
    if (this.flickrImages != null) {
      data['flickr_images'] = this.flickrImages;
    }
    return data;
  }
}

class Timeline {
  int? webcastLiftoff;

  Timeline({this.webcastLiftoff});

  Timeline.fromJson(Map<String, dynamic> json) {
    webcastLiftoff = json['webcast_liftoff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['webcast_liftoff'] = this.webcastLiftoff;
    return data;
  }
}
