import 'dart:developer';

import 'package:appliftingjob/models/past_launch_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../core/endpoints.dart';

class PastLaunchProvider extends ChangeNotifier {
  /// Stored Endpoint URL for apiPastLaunchUrl
  final String _baseUrl = Environment.endpoints.apiPastLaunchUrl;

  /// Stored Last Data from API
  List<PastLaunchesModel> _storedLastData = [];

  /// Stored Filtered data by user Input
  List<PastLaunchesModel> _filteredData = [];

  /// Variable holding amount of finded past launch
  String _totalPastLaunches = "";

  /// Variable holding current hint message
  String _hintMessage = "Name";

  /// Loading data
  bool _isLoading = true;

  /// Search filter
  int _searchFilter = 0;

  /// Getter for filtered Past Launch Data
  List<PastLaunchesModel> get getFilteredData => _filteredData;

  /// Getter for stored Past Launch Data
  List<PastLaunchesModel> get getStoredData => _storedLastData;

  /// Getter for Search Flight Number
  int get getSearchFilter => _searchFilter;

  /// Getter for hint message
  String get getHintMessage => _hintMessage;

  /// Getter for past Launch data
  String get getTotalPastLaunches => _totalPastLaunches;

  /// Getter for isLoading
  bool get getIsLoading => _isLoading;

  /// Seter for searching by Flight
  set setSearchFilter(int newInt) {
    switch (newInt) {
      case 0:
        _searchFilter = 0;
        _hintMessage = "Name";
        break;
      case 1:
        _searchFilter = 1;
        _hintMessage = "ID";
        break;
      case 2:
        _searchFilter = 2;
        _hintMessage = "Flight number";
        break;
      default:
    }
    notifyListeners();
  }

  /// Filter stored data by compare User nput and name
  void searchingByName(String name) {
    final suggestions = _storedLastData.where((item) {
      final polishedName = item.name!.toLowerCase();
      final input = name.toLowerCase();
      return polishedName.contains(input);
    }).toList();
    // Store filtered data from function above
    _filteredData = suggestions;
    storeLenghtOfPL();
    notifyListeners();
  }

  /// Filter stored data by compare User input and ID
  void searchingByID(String id) {
    final suggestions = _storedLastData.where((item) {
      final polishedId = item.id!.toLowerCase();
      final input = id.toLowerCase();
      return polishedId.contains(input);
    }).toList();
    // Store filtered data from function above
    _filteredData = suggestions;
    storeLenghtOfPL();
    notifyListeners();
  }

  /// Filter stored data by compare User input and Flight number
  void searchingByFlight(String flightNumber) {
    final suggestions = _storedLastData.where((item) {
      final polishedFlight = item.flightNumber!.toString().toLowerCase();
      final input = flightNumber.toLowerCase();
      return polishedFlight.contains(input);
    }).toList();
    // Store filtered data from function above
    _filteredData = suggestions;
    storeLenghtOfPL();
    notifyListeners();
  }

  /// Function to set value of total past Launches
  void storeLenghtOfPL() {
    _totalPastLaunches = _filteredData.length.toString();
    notifyListeners();
  }

  /// Function which reset all User filters and display all stored data
  void resetSearchFilters() {
    _filteredData = _storedLastData;
    storeLenghtOfPL();
    notifyListeners();
  }

  /// Get request for getting informations about past launches
  Future<List<PastLaunchesModel>?> getPastLaunchesData() async {
    _isLoading = true;
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
      log("Past Launch API status : status code: ${response.statusCode},  ${response.reasonPhrase}");
      if (response.statusCode == 200) {
        // If success parse data through model
        final parsedData = pastLaunchesModelFromJson(response.body);

        _storedLastData = parsedData;
        // Update filtered data with stored Data
        _filteredData = _storedLastData;
        // Store total amount of finded PastLaunches members
        storeLenghtOfPL();

        return _storedLastData;
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
