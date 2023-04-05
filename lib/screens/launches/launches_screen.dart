import 'package:appliftingjob/providers/launches_provider.dart';
import 'package:appliftingjob/screens/detail/detailed_launch_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class LaunchesScreen extends StatefulWidget {
  const LaunchesScreen({super.key});

  @override
  State<LaunchesScreen> createState() => _LaunchesScreenState();
}

class _LaunchesScreenState extends State<LaunchesScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    context.read<LaunchProvider>().getLaunchesData();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the size of availiable pixels of context
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title: Selector<LaunchProvider, String>(
              selector: (_, provider) => provider.getTotalLaunches,
              builder: (_, value, __) {
                return Text(value != "" ? "Total $value launches" : "");
              }),
          centerTitle: true),
      body: Container(
        color: const Color.fromARGB(255, 232, 248, 255),
        child: Padding(
            padding:
                const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                      width: size.width * 0.95,
                      child: Consumer<LaunchProvider>(
                        builder: (context, provider, child) {
                          return Column(
                            children: [
                              TextField(
                                controller: _textController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search),
                                  border: const OutlineInputBorder(),
                                  hintText:
                                      'Search by ${provider.getHintMessage}',
                                ),
                                onChanged: (value) {
                                  switch (provider.getSearchFilter) {
                                    case 0:
                                      provider.searchingByName(value);
                                      break;
                                    case 1:
                                      provider.searchingByID(value);
                                      break;
                                    case 2:
                                      provider.searchingByFlight(value);
                                      break;
                                    default:
                                  }
                                },
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: provider.getSearchFilter == 0
                                              ? Colors.lightBlue
                                              : Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextButton(
                                          onPressed: () {
                                            provider.resetSearchFilters();
                                            _textController.clear();
                                            provider.setSearchFilter = 0;
                                          },
                                          child: const Text(
                                            "Name",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 13),
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: provider.getSearchFilter == 1
                                              ? Colors.lightBlue
                                              : Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextButton(
                                          onPressed: () {
                                            provider.resetSearchFilters();
                                            _textController.clear();
                                            provider.setSearchFilter = 1;
                                          },
                                          child: const Text(
                                            "Id",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 13),
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: provider.getSearchFilter == 2
                                              ? Colors.lightBlue
                                              : Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextButton(
                                          onPressed: () {
                                            provider.resetSearchFilters();
                                            _textController.clear();
                                            provider.setSearchFilter = 2;
                                          },
                                          child: const Text(
                                            "Flight",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 13),
                                          )),
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: provider.getArePastLaunches
                                              ? Colors.lightBlue
                                              : Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextButton(
                                          onPressed: () {
                                            provider.setPastLaunches = true;
                                            _textController.clear();
                                          },
                                          child: const Text(
                                            "Past",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 13),
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: provider.getArePastLaunches
                                              ? Colors.grey
                                              : Colors.lightBlue,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextButton(
                                          onPressed: () {
                                            provider.setPastLaunches = false;
                                            _textController.clear();
                                          },
                                          child: const Text(
                                            "Upcoming",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 13),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                      )),
                ),
                Expanded(
                  flex: 85,
                  child: Consumer<LaunchProvider>(
                    builder: (context, provider, child) {
                      return provider.getStoredData.isNotEmpty
                          ? ListView.builder(
                              itemCount: provider.getFilteredData.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return cardData(provider, index, size, context);
                              },
                            )
                          :

                          // If no display the loading indicator or resresh button if Api loading failed
                          context.read<LaunchProvider>().getIsLoading
                              ? const Center(
                                  child: CircularProgressIndicator.adaptive())
                              : Center(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text("Error while loading data",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 20),
                                            textAlign: TextAlign.center),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: TextButton(
                                          onPressed: () {
                                            //Refresh the data
                                            setState(() {
                                              context
                                                  .read<LaunchProvider>()
                                                  .getLaunchesData();
                                            });
                                          },
                                          child: Container(
                                            width: 100,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.lightBlue,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: const Center(
                                              child: Text("Refresh",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                      fontSize: 15)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                      // }
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

Widget cardData(
    LaunchProvider provider, int index, Size size, BuildContext context) {
  var width = size.width;
  final data = provider.getFilteredData[index];

  return Card(
      shape: Border.all(color: Colors.black, width: 0.1),
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      color: const Color.fromARGB(115, 111, 212, 255),
      child: InkWell(
        onTap: () {
          // Open detailed Page and pass the data from chosen item
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => DetailLaunchScreen(data: data)));
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  data.name ?? "",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.black38,
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                    width: width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Id: ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data.id ?? "",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                    width: width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Flight number: ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data.flightNumber.toString(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                    width: width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Launch date: ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat("dd.MM.yyyy").format(data.dateUtc!),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
}
