import 'package:appliftingjob/providers/crew_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CrewScreen extends StatefulWidget {
  const CrewScreen({super.key});

  @override
  State<CrewScreen> createState() => _CrewScreenState();
}

class _CrewScreenState extends State<CrewScreen> {
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
                  child: FutureBuilder(
                    future: context.read<CrewScreenProvider>().getCrewData(),
                    builder: (ctx, snapshot) {
                      // Check if the snapshot has data
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.data != null) {
                        // If yes build them
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 400,
                                  childAspectRatio: 8 / 9,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Card(
                                shape:
                                    Border.all(color: Colors.black, width: 0.1),
                                elevation: 5,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                color: const Color.fromARGB(115, 111, 212, 255),
                                child: InkWell(
                                  onTap: () {
                                    context
                                        .read<CrewScreenProvider>()
                                        .launchingUrl(snapshot, index);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 70,
                                          child: Image.network(
                                            filterQuality: FilterQuality.high,
                                            fit: BoxFit.contain,
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                      : null,
                                                ),
                                              );
                                            },
                                            snapshot.data![index].image,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 10,
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              snapshot.data![index].name,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 8,
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              snapshot.data![index].agency,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
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
                                                      const EdgeInsets.all(5),
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
                                                        snapshot.data![index]
                                                            .status,
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
                                                      const EdgeInsets.all(5.0),
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
                                                        snapshot
                                                            .data![index].id,
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
                        );
                      } else {
                        // If no display the loading indicator or resresh button if Api loading failed
                        return context.read<CrewScreenProvider>().getIsLoading
                            ? const Center(
                                child: CircularProgressIndicator.adaptive())
                            : Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          setState(() {});
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
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 15)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                      }
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
