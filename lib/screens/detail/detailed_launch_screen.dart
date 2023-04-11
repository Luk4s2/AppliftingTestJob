import 'package:appliftingjob/models/past_launch_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailLaunchScreen extends StatelessWidget {
  final LaunchesModel data;
  const DetailLaunchScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 248, 255),
      appBar: AppBar(
        title: Text(data.name!),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                data.details ?? "",
                maxLines: 10,
                minFontSize: 5,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueGrey),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: Column(children: const [
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Id :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Flight number :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Launch date :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Rocket :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Launchpad :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Successful launch :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Number of windows :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Total crew :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Total failures :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Total capsules :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Total payloads :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                    ])),
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    children: [
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.id!,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.flightNumber!.toString(),
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                DateFormat("dd.MM.yyyy").format(data.dateUtc!),
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.rocket ?? "No data",
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.launchpad ?? "No data",
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.success == null
                                    ? "No Data"
                                    : data.success!
                                        ? "Success"
                                        : "Failure",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: data.success == null
                                        ? Colors.red
                                        : Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.window == null
                                    ? "No Data"
                                    : data.window!.toString(),
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: data.window == null
                                        ? Colors.red
                                        : Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.crew == null
                                    ? "No data"
                                    : data.crew!.length.toString(),
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.failures == null
                                    ? "No data"
                                    : data.failures!.length.toString(),
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.capsules == null
                                    ? "No data"
                                    : data.capsules!.length.toString(),
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.payloads == null
                                    ? "No data"
                                    : data.payloads!.length.toString(),
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 50),
              child: AutoSizeText(
                "Used core data",
                minFontSize: 5,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: Column(children: const [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Core :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Number of flights :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Legs :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Reused :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Landing attempt :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Landing success :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Landing type :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Landpad :",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                    ])),
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.cores == null
                                    ? "No data"
                                    : data.cores![0].core == null
                                        ? "No data"
                                        : data.cores![0].core!,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: data.cores![0].core == null
                                        ? Colors.red
                                        : Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.cores == null
                                    ? "No data"
                                    : data.cores![0].flight == null
                                        ? "No data"
                                        : data.cores![0].flight!.toString(),
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: data.cores![0].flight == null
                                        ? Colors.red
                                        : Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.cores == null
                                    ? "No data"
                                    : data.cores![0].legs == null
                                        ? "No data"
                                        : data.cores![0].legs!
                                            ? "Yes"
                                            : "No",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: data.cores![0].legs == null
                                        ? Colors.red
                                        : Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.cores == null
                                    ? "No data"
                                    : data.cores![0].reused == null
                                        ? "No data"
                                        : data.cores![0].reused!
                                            ? "Yes"
                                            : "No",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: data.cores![0].reused == null
                                        ? Colors.red
                                        : Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.cores == null
                                    ? "No data"
                                    : data.cores![0].landingAttempt == null
                                        ? "No data"
                                        : data.cores![0].landingAttempt!
                                            ? "Yes"
                                            : "No",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: data.cores![0].landingAttempt == null
                                        ? Colors.red
                                        : Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.cores == null
                                    ? "No data"
                                    : data.cores![0].landingSuccess == null
                                        ? "No data"
                                        : data.cores![0].landingSuccess!
                                            ? "Yes"
                                            : "No",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: data.cores![0].landingSuccess == null
                                        ? Colors.red
                                        : Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.cores == null
                                    ? "No data"
                                    : data.cores![0].landingType == null
                                        ? "No data"
                                        : data.cores![0].landingType!,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: data.cores![0].landingType == null
                                        ? Colors.red
                                        : Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: 30,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                data.cores == null
                                    ? "No data"
                                    : data.cores![0].landpad == null
                                        ? "No data"
                                        : data.cores![0].landpad!,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: data.cores![0].landpad == null
                                        ? Colors.red
                                        : Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                        thickness: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
