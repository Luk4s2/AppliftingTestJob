import 'package:appliftingjob/models/past_launch_model.dart';
import 'package:flutter/material.dart';

class DetailLaunchScreen extends StatelessWidget {
  final LaunchesModel data;
  const DetailLaunchScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    print("Instantiate Upcoming Screen");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(data.name!),
      ),
    );
  }
}
