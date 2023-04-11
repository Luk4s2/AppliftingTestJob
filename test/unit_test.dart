import 'package:appliftingjob/providers/bottom_bar_provider.dart';
import 'package:appliftingjob/providers/launches_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // Some example of Unit testing of app
  final bottomNavP = BottomNavigationBarProvider();
  final launchP = LaunchProvider();

  // Bottom Navigation provider tests
  test("initial page displayed", () {
    // Initial page view
    var result = bottomNavP.currentTabIndex;
    expect(result, 0);
    //Check the setter for changing the page
    bottomNavP.currentTabIndexSet = 1;
    result = bottomNavP.currentTabIndex;
    expect(result, 1);
  });

  // Launch Provider tests
  test("Search filter test", () {
    var result = launchP.getSearchFilter;
    var currentHint = launchP.getHintMessage;
    // Initial filter value
    expect(result, 0);
    expect(currentHint, "Name");
    // Use search filter
    launchP.setSearchFilter = 1;
    result = launchP.getSearchFilter;
    currentHint = launchP.getHintMessage;
    expect(result, 1);
    expect(currentHint, "ID");
    launchP.setSearchFilter = 2;
    result = launchP.getSearchFilter;
    currentHint = launchP.getHintMessage;
    expect(result, 2);
    expect(currentHint, "Flight number");
  });

  test('Check switching upcoming and past launches', () {
    var pastLaunch = launchP.getArePastLaunches;
    // Initial value
    expect(pastLaunch, true);
    // Set the new value
    launchP.setPastLaunches = false;
    pastLaunch = launchP.getArePastLaunches;
    expect(pastLaunch, false);
  });

  test('Update searched data', () async {
    var dataToCompare = launchP.getStoredData;
    var filteredData = launchP.getFilteredData;
    // Call the api function
    await launchP.getLaunchesData();
    // check data if update on call
    launchP.resetSearchFilters();
    expect(filteredData, dataToCompare);
  });
  test('Test one of the filtering', () async {
    List<String> storedData = [];
    bool finnalCompare;
    // Check if the input filter out correctly
    await launchP.getLaunchesData();
    launchP.searchingByName("Falcon");
    var originalData = launchP.getFilteredData;

    // Store Launch Name to list of Strings
    for (var element in originalData) {
      storedData.add(element.name!);
    }
    // Check the compare
    finnalCompare = storedData.every((element) {
      if (storedData.isNotEmpty) {
        if (element.contains("Falcon")) {
          return true;
        }
        return false;
      }
      return false;
    });

    expect(finnalCompare, true);
  });
  test('Can Load preferences', () async {
    // Mock the initial values
    SharedPreferences.setMockInitialValues({
      "name": "Falcon",
      "id": "56dsdd4g56c",
      "sortFilter": true,
      "pastLaunches": false,
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    expect(pref.getString('name'), 'Falcon');
    expect(pref.getString('id'), '56dsdd4g56c');
    expect(pref.getBool('sortFilter'), true);
    expect(pref.getBool("pastLaunches"), false);
  });
}
