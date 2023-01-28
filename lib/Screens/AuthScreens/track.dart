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
        log(data.toString());
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
                          child: Center(child: Text("\$274"))),
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
                          child: Center(child: Text("Not Approved")))
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
                          "USA",
                          style: titleLarge(fontColor: Palette.primaryColor),
                        ),
                        Icon(
                          Icons.public,
                          size: 80,
                          color: Palette.secondaryCorrectColor,
                        ),
                        Text(
                          "UK",
                          style: titleLarge(fontColor: Palette.primaryColor),
                        )
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
                          style: titleLarge(),
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
                              "Name of the Product",
                              style:
                                  titleLarge(fontColor: Palette.primaryColor),
                            ),
                            Text(
                              "Catog of the Product",
                              style: bodyMedium(),
                            ),
                            Text(
                              "Quanitity: ${5}",
                              style: bodyMedium(),
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
