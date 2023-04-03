import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../models/crew_model.dart';
import '../core/endpoints.dart';

class CrewScreenProvider extends ChangeNotifier {
  /// Stored Endpoint URL for apiCrew
  final String _baseUrl = Environment.endpoints.apiCrewURL;

  /// Variable holding amount of finded crews
  String _totalCrews = "";

  /// Loading data
  bool _isLoading = true;

  /// Getter for totalCrew
  String get getTotalCrew => _totalCrews;

  /// Getter for isLoading
  bool get getIsLoading => _isLoading;

  /// Function to set value of total crew members
  void storeCrewLength(List<CrewModel> data) {
    _totalCrews = data.length.toString();
    notifyListeners();
  }

  /// Open the URL of the selected Crew Member
  Future<void> launchingUrl(AsyncSnapshot snapshot, int index) async {
    if (!await launchUrl(Uri.parse(snapshot.data![index].wikipedia))) {
      throw Exception('Could not launch ${snapshot.data![index].wikipedia}');
    }
  }

  /// Get request for getting informations about crew
  Future<List<CrewModel>?> getCrewData() async {
    _isLoading = true;
    _totalCrews = "";
    final url = Uri.parse(_baseUrl);
    final request = http.get(
      url,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    ).timeout(const Duration(seconds: 5));

    try {
      final response = await request;
      log("Crew API status : status code: ${response.statusCode},  ${response.reasonPhrase}");
      if (response.statusCode == 200) {
        // If success parse data through model
        final parsedData = crewModelFromJson(response.body);
        // Store total amount of finded Crews members
        storeCrewLength(parsedData);

        return parsedData;
      } else {
        log("Error");
        //Show refresh Button
        _isLoading = false;

        return null;
      }
    } on Exception catch (error) {
      log('Failed get status reason : $error');
      //Show refresh Button
      _isLoading = false;

      return null;
    }
  }
}
