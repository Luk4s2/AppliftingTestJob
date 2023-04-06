import 'dart:developer';

import 'package:appliftingjob/models/past_launch_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../core/endpoints.dart';

class LaunchProvider extends ChangeNotifier {
  /// Stored Last Data from API
  List<LaunchesModel> _storedLastData = [];

  /// Stored Filtered data by user Input
  List<LaunchesModel> _filteredData = [];

  /// Variable holding amount of finded past launch
  String _totalLaunches = "";

  /// Variable holding current hint message
  String _hintMessage = "Name";

  /// Loading data
  bool _isLoading = true;

  /// Search filter
  int _searchFilter = 0;

  /// Sort filter
  int _sortFilter = 0;

  /// Bool to check if sort filter by name is Ascendant or Descendant
  bool _isSortNameAsc = true;

  /// Bool to check if sort filter by date is Ascendant or Descendant
  bool _isSortDateAsc = true;

  /// Bool to check if past or upcoming launches are choosen
  bool _arePastLaunches = true;

  /// Getter for filtered Past Launch Data
  List<LaunchesModel> get getFilteredData => _filteredData;

  /// Getter for stored Past Launch Data
  List<LaunchesModel> get getStoredData => _storedLastData;

  /// Getter for check if is Sort by name Ascendant
  bool get getSortNameIsAsc => _isSortNameAsc;

  /// Getter for check if is Sort by date Ascendant
  bool get getSortDateIsAsc => _isSortDateAsc;

  /// Getter for bool which checking upcoming or past launches
  bool get getArePastLaunches => _arePastLaunches;

  /// Getter for Sort Filter
  int get getSortFilter => _sortFilter;

  /// Getter for Search Filter
  int get getSearchFilter => _searchFilter;

  /// Getter for hint message
  String get getHintMessage => _hintMessage;

  /// Getter for past Launch data
  String get getTotalLaunches => _totalLaunches;

  /// Getter for isLoading
  bool get getIsLoading => _isLoading;

  /// Setter for choosing between past and upcoming launches
  set setPastLaunches(bool newBool) {
    _arePastLaunches = newBool;
    // Clear stored last data
    _storedLastData = [];
    _totalLaunches = "";
    // Get new updated data from api
    getLaunchesData();
    notifyListeners();
  }

  /// Seter for choosen search filter by user
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

  /// Seter for seting sort filter by user
  set setSortFilter(int newInt) {
    switch (newInt) {
      case 0:
        _sortFilter = 0;
        break;
      case 1:
        // Check if the sort filter is initialy turned on or its second attempt
        if (_sortFilter == 1) {
          _isSortNameAsc = !_isSortNameAsc;
        }
        // Second sort filter set to initial arrow pointing up
        _isSortDateAsc = true;
        // Then set sort filter to value choosen by user and apply sort function
        _sortFilter = 1;
        _sortByName();
        break;
      case 2:
        // Check if the sort filter is initialy turned on or its second attempt
        if (_sortFilter == 2) {
          _isSortDateAsc = !_isSortDateAsc;
        }
        // Second sort filter set to initial arrow pointing up
        _isSortNameAsc = true;
        // Then set sort filter to value choosen by user and apply sort function
        _sortFilter = 2;
        _sortByDate();
        break;
      default:
    }
    notifyListeners();
  }

  /// Function to check and apply sorting data after load new data
  void _usedSortingFilter() {
    switch (_sortFilter) {
      case 1:
        _sortByName();
        break;
      case 2:
        _sortByDate();
        break;
      default:
    }
  }

  /// Function to Sort data by name
  void _sortByName() {
    // Ascendant way
    if (_isSortNameAsc) {
      _filteredData.sort(
        (a, b) => a.name!.compareTo(b.name!),
      );
      // Descendant way
    } else {
      _filteredData.sort(
        (a, b) => b.name!.compareTo(a.name!),
      );
    }
  }

  /// Function to Sort data by date
  void _sortByDate() {
    // Ascendant way
    if (_isSortDateAsc) {
      _filteredData.sort(
        (a, b) => a.dateUtc!.compareTo(b.dateUtc!),
      );
      // Descendant way
    } else {
      _filteredData.sort(
        (a, b) => b.dateUtc!.compareTo(a.dateUtc!),
      );
    }
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
    _totalLaunches =
        "${_filteredData.length} ${_arePastLaunches ? "past" : "upcoming"}";
    notifyListeners();
  }

  /// Function which reset all User filters and display all stored data
  void resetSearchFilters() {
    _filteredData = _storedLastData;
    storeLenghtOfPL();
    notifyListeners();
  }

  /// Get request for getting informations about past launches
  Future<List<LaunchesModel>?> getLaunchesData() async {
    /// Stored Endpoint URL from endpoints
    final String baseUrl = _arePastLaunches
        ? Environment.endpoints.apiPastLaunchUrl
        : Environment.endpoints.apiUpcomingLaunchUrl;
    _isLoading = true;
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
      log("Past Launch API status : status code: ${response.statusCode},  ${response.reasonPhrase}");
      if (response.statusCode == 200) {
        // If success parse data through model
        final parsedData = launchesModelFromJson(response.body);

        _storedLastData = parsedData;
        // Update filtered data with stored Data
        _filteredData = _storedLastData;
        // Store total amount of finded PastLaunches members
        storeLenghtOfPL();
        // Apply sorting filter method if any was turned on
        _usedSortingFilter();
        _isLoading = false;

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
