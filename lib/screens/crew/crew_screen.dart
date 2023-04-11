import 'package:appliftingjob/providers/crew_screen_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CrewScreen extends StatefulWidget {
  const CrewScreen({super.key});

  @override
  State<CrewScreen> createState() => _CrewScreenState();
}

class _CrewScreenState extends State<CrewScreen> {
  @override
  void initState() {
    context.read<CrewScreenProvider>().getCrewData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Selector<CrewScreenProvider, String>(
              selector: (_, crewScreenProvider) =>
                  crewScreenProvider.getTotalCrew,
              builder: (_, value, __) {
                return Text(value != "" ? "Total $value crew members" : "");
              }),
          centerTitle: true),
      body: Container(
        color: const Color.fromARGB(255, 232, 248, 255),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 90,
                  child: Consumer<CrewScreenProvider>(
                    builder: (context, provider, child) {
                      return provider.getStoredData.isNotEmpty
                          ? GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 400,
                                      childAspectRatio: 8 / 9,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemCount: provider.getStoredData.length,
                              itemBuilder: (BuildContext ctx, index) {
                                final data = provider.getStoredData[index];
                                return Card(
                                    shape: Border.all(
                                        color: Colors.black, width: 0.1),
                                    elevation: 5,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 10),
                                    color: const Color.fromARGB(
                                        115, 111, 212, 255),
                                    child: InkWell(
                                      onTap: () {
                                        provider.launchingUrl(data, index);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 70,
                                                child: CachedNetworkImage(
                                                  fadeOutDuration:
                                                      const Duration(
                                                          seconds: 0),
                                                  imageUrl: data.image,
                                                  progressIndicatorBuilder:
                                                      (context, url, progress) {
                                                    return Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                              value: progress
                                                                  .progress),
                                                    );
                                                  },
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                )),
                                            Expanded(
                                              flex: 10,
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  data.name,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 8,
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  data.agency,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 8,
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: SizedBox(
                                                    width: 250,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            "Status: ",
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            data.status,
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 8,
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: SizedBox(
                                                    width: 250,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            "Id: ",
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            data.id,
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ));
                              },
                            )
                          :
                          // If no data display the loading indicator or refresh button if Api loading failed
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
                                            //Rebuild the page
                                            setState(() {
                                              provider.getCrewData();
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
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
