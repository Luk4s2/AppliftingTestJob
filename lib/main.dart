import 'package:appliftingjob/providers/bottom_bar_provider.dart';
import 'package:appliftingjob/providers/crew_screen_provider.dart';
import 'package:appliftingjob/routes/routes.dart';
import 'package:appliftingjob/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CrewScreenProvider>(
            create: (_) => CrewScreenProvider()),
        ChangeNotifierProvider<BottomNavigationBarProvider>(
            create: (_) => BottomNavigationBarProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.home,
      routes: {AppRoute.home: (context) => HomeScreen()},
    );
  }
}
