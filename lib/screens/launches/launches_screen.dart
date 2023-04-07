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
    // Load User Filters if have some and get data
    context.read<LaunchProvider>().loadFilter();
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Selector<LaunchProvider, String>(
              selector: (_, provider) => provider.getTotalLaunches,
              builder: (_, value, __) {
                return Text(value != "" ? "Total $value launches" : "");
              }),
          centerTitle: true),
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          color: const Color.fromARGB(255, 232, 248, 255),
          child: Padding(
              padding: const EdgeInsets.only(
                top: 5,
                left: 20,
                right: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: orientation == Orientation.portrait ? 20 : 35,
                    child: SizedBox(
                        width: size.width * 0.95,
                        child: Consumer<LaunchProvider>(
                          builder: (context, provider, child) {
                            return Column(
                              children: [
                                Expanded(
                                  flex: orientation == Orientation.portrait
                                      ? 60
                                      : 60,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 90,
                                        child: TextField(
                                          controller: _textController,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.all(5),
                                            prefixIcon: const FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Icon(Icons.search)),
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
                                                provider
                                                    .searchingByFlight(value);
                                                break;
                                              default:
                                            }
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.lightBlue,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TextButton(
                                                onPressed: () async {
                                                  // Save current user filter
                                                  await provider
                                                      .saveFilter()
                                                      .then((_) {
                                                    // Remove previously snackbar if any open
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .removeCurrentSnackBar();
                                                    // Inform user that his filter has been saved
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                                width: 200,
                                                                behavior:
                                                                    SnackBarBehavior
                                                                        .floating,
                                                                duration:
                                                                    Duration(
                                                                        seconds:
                                                                            1),
                                                                content: Center(
                                                                  child: Text(
                                                                      "Sucesfully saved filter"),
                                                                )));
                                                  });
                                                },
                                                child: const FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    softWrap: true,
                                                    maxLines: 2,
                                                    "Save\nfilters",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize: 13),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: orientation == Orientation.portrait
                                      ? 40
                                      : 50,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 10,
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    provider.getSearchFilter ==
                                                            0
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
                                              child: const FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  "Name",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 13),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    provider.getSearchFilter ==
                                                            1
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
                                              child: const FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  "Id",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 13),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    provider.getSearchFilter ==
                                                            2
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
                                              child: const FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  "Flight",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 13),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 5,
                                      ),
                                      Expanded(
                                        flex: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    provider.getSortFilter == 1
                                                        ? Colors.lightBlue
                                                        : Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TextButton(
                                                onPressed: () {
                                                  provider.setSortFilter = 1;
                                                },
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Row(
                                                    children: [
                                                      const Text(
                                                        "Sort name",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 13),
                                                      ),
                                                      Icon(
                                                        provider.getSortNameIsAsc
                                                            ? Icons
                                                                .arrow_upward_rounded
                                                            : Icons
                                                                .arrow_downward_rounded,
                                                        color: Colors.white,
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    provider.getSortFilter == 2
                                                        ? Colors.lightBlue
                                                        : Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TextButton(
                                              onPressed: () {
                                                provider.setSortFilter = 2;
                                              },
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Row(
                                                  children: [
                                                    const Text(
                                                      "Sort date",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 13),
                                                    ),
                                                    Icon(
                                                      provider.getSortDateIsAsc
                                                          ? Icons
                                                              .arrow_upward_rounded
                                                          : Icons
                                                              .arrow_downward_rounded,
                                                      color: Colors.white,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 5,
                                      ),
                                      Expanded(
                                        flex: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    provider.getArePastLaunches
                                                        ? Colors.lightBlue
                                                        : Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TextButton(
                                              onPressed: () {
                                                // Prevent User from clicking multiple times befor data are loaded
                                                if (provider.getIsLoading ==
                                                    false) {
                                                  provider.setPastLaunches =
                                                      true;
                                                  _textController.clear();
                                                }
                                              },
                                              child: const FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  "Previous",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 13),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 15,
                                          child: Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: provider
                                                          .getArePastLaunches
                                                      ? Colors.grey
                                                      : Colors.lightBlue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: TextButton(
                                                onPressed: () {
                                                  // Prevent User from clicking multiple times befor data are loaded
                                                  if (provider.getIsLoading ==
                                                      false) {
                                                    provider.setPastLaunches =
                                                        false;
                                                    _textController.clear();
                                                  }
                                                },
                                                child: const FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    "Upcoming",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        )),
                  ),
                  Expanded(
                    flex: orientation == Orientation.portrait ? 80 : 65,
                    child: Consumer<LaunchProvider>(
                      builder: (context, provider, child) {
                        return provider.getStoredData.isNotEmpty
                            ? ListView.builder(
                                itemCount: provider.getFilteredData.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return cardData(
                                      provider, index, size, context);
                                },
                              )
                            :

                            // If no display the loading indicator or resresh button if Api loading failed
                            provider.getIsLoading
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
                                          child: Text(
                                              "Error while loading data",
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
                                                provider.getLaunchesData();
                                              });
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.lightBlue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
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
        );
      }),
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
