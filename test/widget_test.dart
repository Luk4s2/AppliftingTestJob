import 'package:appliftingjob/providers/launches_provider.dart';
import 'package:appliftingjob/screens/launches/launches_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  // Some examples of widget testing of app
  testWidgets("Launch Screen widget tests", (WidgetTester tester) async {
    // Find textfield Widget
    var textField = find.byKey(const ValueKey("textfield"));
    // Pump Widget
    await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider(
      create: (context) => LaunchProvider(),
      builder: (context, _) => const LaunchesScreen(),
    )));
    expect(textField, findsOneWidget);
    // Enter some text
    await tester.enterText(textField, "Applifting Widget Test");
    expect(find.text("Applifting Widget Test"), findsOneWidget);
    // Find button ID
    var idButton = find.text("Id");
    expect(idButton, findsOneWidget);
    // Press the button ID
    await tester.tap(idButton);
    expect(find.text("Search by ID"), findsNothing);
    // Wait one frame
    await tester.pump();
    // Hint text should be changed
    expect(find.text("Search by Flight number"), findsNothing);
    expect(find.text("Search by Name"), findsNothing);
    expect(find.text("Search by ID"), findsOneWidget);
    // Find the button name
    var nameButton = find.text("Name");
    expect(nameButton, findsOneWidget);
    // Press the button Name
    await tester.tap(nameButton);
    expect(find.text("Search by Name"), findsNothing);
    // Wait one frame
    await tester.pump();
    // Now the hint should be changed from ID to name
    expect(find.text("Search by ID"), findsNothing);
    expect(find.text("Search by Flight number"), findsNothing);
    expect(find.text("Search by Name"), findsOneWidget);
    // Find the button Flight Number
    var flightNumberButton = find.text("Flight");
    expect(flightNumberButton, findsOneWidget);
    // Press the button Flight Number
    await tester.tap(flightNumberButton);
    expect(find.text("Search by Flight number"), findsNothing);
    // Wait one frame
    await tester.pump();
    // Now the hint should be changed from name to Flight Number
    expect(find.text("Search by ID"), findsNothing);
    expect(find.text("Search by Name"), findsNothing);
    expect(find.text("Search by Flight number"), findsOneWidget);
  });
}
