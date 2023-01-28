import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/AuthScreens/track/provider.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';
import 'package:toast/toast.dart';

class Track extends ConsumerStatefulWidget {
  const Track({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TrackState();
}

class _TrackState extends ConsumerState<Track> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(data_track);
    return data.when(
      data: (data) {
        // if (data == false) {
        //   Navigator.pop(context);
        // }
        log(data.toString() + "This");
        return SafeArea(
            child: Scaffold(
                bottomNavigationBar: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 56,
                          decoration: BoxDecoration(
                              color: Palette.primaryColor,
                              border: Border(
                                  top:
                                      BorderSide(color: Colors.black, width: 2),
                                  right: BorderSide(
                                      color: Colors.black, width: 2))),
                          width: MediaQuery.of(context).size.width / 2,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "\$${data["expected_price"]}",
                                style: bodyLarge(),
                              ),
                              Text(
                                "Predicted Prize",
                                style: bodyMedium(),
                              ),
                            ],
                          ))),
                      Container(
                          height: 56,
                          decoration: BoxDecoration(
                              color: Palette.primaryColor,
                              border: Border(
                                  top:
                                      BorderSide(color: Colors.black, width: 2),
                                  right: BorderSide(
                                      color: Colors.black, width: 2))),
                          width: MediaQuery.of(context).size.width / 2,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                data["final_price"] == null
                                    ? "${data["status"]}"
                                    : "${data["final_price"]}",
                                style: bodyLarge(),
                              ),
                              Text(
                                "final Prize",
                                style: bodyMedium(),
                              ),
                            ],
                          )))
                    ]),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 48,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          data["source"]["location"].toString().substring(0,
                              data["source"]["location"].toString().length - 3),
                          style:
                              headlineMedium(fontColor: Palette.primaryColor),
                        ),
                        Icon(
                          Icons.public,
                          size: 80,
                          color: Palette.secondaryCorrectColor,
                        ),
                        Text(
                          data["source"]["location"].toString().substring(
                              0,
                              data["destination"]["location"]
                                      .toString()
                                      .length -
                                  3),
                          style:
                              headlineMedium(fontColor: Palette.primaryColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Divider(
                        height: 10,
                        thickness: 5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 48),
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          "Product",
                          style: headlineMedium(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${data["commodity"]["name"]}",
                              style: headlineLarge(
                                  fontColor: Palette.primaryColor),
                            ),
                            Text(
                              "${data["commodity"]["category"]["name"].toString().substring(3).split("_").join(" ")}",
                              style: headlineSmall(),
                            ),
                            Text(
                              "Quanitity: ${data["quantity"]}",
                              style: headlineSmall(),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )));
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
