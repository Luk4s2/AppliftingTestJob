import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../models/crew_model.dart';
import '../core/endpoints.dart';

class CrewScreenProvider extends ChangeNotifier {
  /// Variable holding amount of finded crews
  String _totalCrews = "";

  /// Stored Data
  List<CrewModel> _storedData = [];

  /// Loading data
  bool _isLoading = true;

  List<CrewModel> get getStoredData => _storedData;

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
  Future<void> launchingUrl(CrewModel data, int index) async {
    if (!await launchUrl(Uri.parse(data.wikipedia))) {
      throw Exception('Could not launch ${data.wikipedia}');
    }
  }

  /// Get request for getting informations about crew
  Future<List<CrewModel>?> getCrewData() async {
    /// Stored Endpoint URL for apiCrew
    final String baseUrl = Environment.endpoints.apiCrewURL;
    _isLoading = true;
    _totalCrews = "";
    final url = Uri.parse(baseUrl);
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
        // Store data for later
        _storedData = parsedData;
        _isLoading = false;
        // Store total amount of finded Crews members
        storeCrewLength(parsedData);
        return _storedData;
      } else {
        log("Error");
        //Show refresh Button
        _isLoading = false;
        notifyListeners();
        return null;
      }
    } on Exception catch (error) {
      log('Failed get status reason : $error');
      //Show refresh Button
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }
}
