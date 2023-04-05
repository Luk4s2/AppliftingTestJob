// To parse this JSON data, do
//
//     final pastLaunchesModel = pastLaunchesModelFromJson(jsonString);

import 'dart:convert';

List<PastLaunchesModel> pastLaunchesModelFromJson(String str) =>
    List<PastLaunchesModel>.from(
        json.decode(str).map((x) => PastLaunchesModel.fromJson(x)));

String pastLaunchesModelToJson(List<PastLaunchesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PastLaunchesModel {
  PastLaunchesModel({
    this.fairings,
    this.net,
    this.window,
    this.rocket,
    this.success,
    this.failures,
    this.details,
    this.crew,
    this.ships,
    this.capsules,
    this.payloads,
    this.launchpad,
    this.flightNumber,
    this.name,
    this.dateUtc,
    this.dateUnix,
    this.dateLocal,
    this.datePrecision,
    this.upcoming,
    this.cores,
    this.autoUpdate,
    this.tbd,
    this.launchLibraryId,
    this.id,
  });

  final Fairings? fairings;
  final bool? net;
  final dynamic window;
  final String? rocket;
  final bool? success;
  final List<dynamic>? failures;
  final dynamic details;
  final List<dynamic>? crew;
  final List<dynamic>? ships;
  final List<dynamic>? capsules;
  final List<String>? payloads;
  final String? launchpad;
  final int? flightNumber;
  final String? name;
  final DateTime? dateUtc;
  final int? dateUnix;
  final DateTime? dateLocal;
  final String? datePrecision;
  final bool? upcoming;
  final List<Core>? cores;
  final bool? autoUpdate;
  final bool? tbd;
  final dynamic launchLibraryId;
  final String? id;

  factory PastLaunchesModel.fromJson(Map<String, dynamic> json) =>
      PastLaunchesModel(
        fairings: json["fairings"] == null
            ? null
            : Fairings.fromJson(json["fairings"]),
        net: json["net"],
        window: json["window"],
        rocket: json["rocket"],
        success: json["success"],
        failures: json["failures"] == null
            ? []
            : List<dynamic>.from(json["failures"]!.map((x) => x)),
        details: json["details"],
        crew: json["crew"] == null
            ? []
            : List<dynamic>.from(json["crew"]!.map((x) => x)),
        ships: json["ships"] == null
            ? []
            : List<dynamic>.from(json["ships"]!.map((x) => x)),
        capsules: json["capsules"] == null
            ? []
            : List<dynamic>.from(json["capsules"]!.map((x) => x)),
        payloads: json["payloads"] == null
            ? []
            : List<String>.from(json["payloads"]!.map((x) => x)),
        launchpad: json["launchpad"],
        flightNumber: json["flight_number"],
        name: json["name"],
        dateUtc:
            json["date_utc"] == null ? null : DateTime.parse(json["date_utc"]),
        dateUnix: json["date_unix"],
        dateLocal: json["date_local"] == null
            ? null
            : DateTime.parse(json["date_local"]),
        datePrecision: json["date_precision"],
        upcoming: json["upcoming"],
        cores: json["cores"] == null
            ? []
            : List<Core>.from(json["cores"]!.map((x) => Core.fromJson(x))),
        autoUpdate: json["auto_update"],
        tbd: json["tbd"],
        launchLibraryId: json["launch_library_id"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "fairings": fairings?.toJson(),
        "net": net,
        "window": window,
        "rocket": rocket,
        "success": success,
        "failures":
            failures == null ? [] : List<dynamic>.from(failures!.map((x) => x)),
        "details": details,
        "crew": crew == null ? [] : List<dynamic>.from(crew!.map((x) => x)),
        "ships": ships == null ? [] : List<dynamic>.from(ships!.map((x) => x)),
        "capsules":
            capsules == null ? [] : List<dynamic>.from(capsules!.map((x) => x)),
        "payloads":
            payloads == null ? [] : List<dynamic>.from(payloads!.map((x) => x)),
        "launchpad": launchpad,
        "flight_number": flightNumber,
        "name": name,
        "date_utc": dateUtc?.toIso8601String(),
        "date_unix": dateUnix,
        "date_local": dateLocal?.toIso8601String(),
        "date_precision": datePrecision,
        "upcoming": upcoming,
        "cores": cores == null
            ? []
            : List<dynamic>.from(cores!.map((x) => x.toJson())),
        "auto_update": autoUpdate,
        "tbd": tbd,
        "launch_library_id": launchLibraryId,
        "id": id,
      };
}

class Core {
  Core({
    this.core,
    this.flight,
    this.gridfins,
    this.legs,
    this.reused,
    this.landingAttempt,
    this.landingSuccess,
    this.landingType,
    this.landpad,
  });

  final String? core;
  final int? flight;
  final bool? gridfins;
  final bool? legs;
  final bool? reused;
  final bool? landingAttempt;
  final bool? landingSuccess;
  final String? landingType;
  final String? landpad;

  factory Core.fromJson(Map<String, dynamic> json) => Core(
        core: json["core"],
        flight: json["flight"],
        gridfins: json["gridfins"],
        legs: json["legs"],
        reused: json["reused"],
        landingAttempt: json["landing_attempt"],
        landingSuccess: json["landing_success"],
        landingType: json["landing_type"],
        landpad: json["landpad"],
      );

  Map<String, dynamic> toJson() => {
        "core": core,
        "flight": flight,
        "gridfins": gridfins,
        "legs": legs,
        "reused": reused,
        "landing_attempt": landingAttempt,
        "landing_success": landingSuccess,
        "landing_type": landingType,
        "landpad": landpad,
      };
}

class Fairings {
  Fairings({
    this.reused,
    this.recoveryAttempt,
    this.recovered,
    this.ships,
  });

  final dynamic reused;
  final dynamic recoveryAttempt;
  final dynamic recovered;
  final List<dynamic>? ships;

  factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
        reused: json["reused"],
        recoveryAttempt: json["recovery_attempt"],
        recovered: json["recovered"],
        ships: json["ships"] == null
            ? []
            : List<dynamic>.from(json["ships"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "reused": reused,
        "recovery_attempt": recoveryAttempt,
        "recovered": recovered,
        "ships": ships == null ? [] : List<dynamic>.from(ships!.map((x) => x)),
      };
}
