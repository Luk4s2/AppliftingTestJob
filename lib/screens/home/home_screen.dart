import 'package:appliftingjob/screens/crew/crew_screen.dart';
import 'package:appliftingjob/screens/past/past_launches_screen.dart';
import 'package:appliftingjob/screens/upcoming/upcoming_launches_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/bottom_bar_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  //List of Pages
  final List<Widget> _pages = [
    const PastLaunchesScreen(),
    const UpcomingLaunchesScreen(),
    const CrewScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarProvider bottomNavProvider =
        context.watch<BottomNavigationBarProvider>();

    return Scaffold(
      body: _pages[bottomNavProvider.currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavProvider.currentTabIndex,
        items: [
          BottomNavigationBarItem(
              icon: Transform.rotate(
                  angle: 90, child: const Icon(Icons.rocket_launch_sharp)),
              label: "Past"),
          BottomNavigationBarItem(
              icon: Transform.rotate(
                  angle: 75, child: const Icon(Icons.rocket_launch_sharp)),
              label: "Upcoming"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_3_sharp), label: "Crew")
        ],
        // On tap change current displayed screen
        onTap: (index) => bottomNavProvider.currentTabIndexSet = index,
      ),
    );
  }
}
