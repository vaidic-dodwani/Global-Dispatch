// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globaldispatch/Screens/HomePage/AdminPages/admin_send_price.dart';
import 'package:globaldispatch/Screens/HomePage/AdminPages/provider.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';
import 'package:globaldispatch/Screens/Widgets/warehouse.dart';

class AdminHomeTab extends ConsumerWidget {
  const AdminHomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(admin_data);
    return SizedBox(
      child: Center(
          child: data.when(
        data: (data) {
          log(data.toString());
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  int shipid = data[index]["id"];
                  int price = data[index]["expected_price"];

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminSendPrice(
                            predictedPrice: price.floorToDouble(),
                            shipId: shipid.toString()),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Palette.neutralBlack,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    width: double.infinity,
                    height: 76,
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: Center(
                            child: SvgPicture.asset(true
                                ? "assests/sold_icon.svg"
                                : "assests/bought_icon.svg"),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 38,
                                    child: Column(
                                      children: [
                                        Text(
                                          (data[index]['source']['business'] ==
                                                  null)
                                              ? ""
                                              : data[index]['source']
                                                  ['business']['name'],
                                          style: titleSmall(
                                              fontColor: Palette.primaryColor),
                                        ),
                                        Text(
                                            (data[index]['source']['location']
                                                        .toString()
                                                        .length <
                                                    4)
                                                ? ""
                                                : data[index]['source']
                                                        ['location']
                                                    .toString()
                                                    .substring(
                                                        0,
                                                        data[index]['source']
                                                                    ['location']
                                                                .toString()
                                                                .length -
                                                            3),
                                            style: labelSmall())
                                      ],
                                    ),
                                  ),
                                  Text("to", style: titleSmall()),
                                  Column(
                                    children: [
                                      Text(
                                          (data[index]['destination']
                                                      ['business'] ==
                                                  null)
                                              ? ""
                                              : data[index]['destination']
                                                      ['business']['name']
                                                  .toString(),
                                          style: titleSmall(
                                              fontColor: Palette.primaryColor)),
                                      Text(
                                          (data[index]['destination']
                                                      ['business'] ==
                                                  null)
                                              ? ""
                                              : data[index]['destination']
                                                      ['location']
                                                  .toString()
                                                  .substring(
                                                      0,
                                                      data[index]['destination']
                                                                  ['location']
                                                              .toString()
                                                              .length -
                                                          3),
                                          style: labelSmall())
                                    ],
                                  )
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 22.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data[index]['status'],
                                        style: labelSmall(),
                                      ),
                                      Text(
                                        "\$ ${data[index]['final_price'] ?? data[index]['expected_price']}",
                                        style: labelSmall(
                                            fontColor:
                                                Palette.secondaryCorrectColor),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      )),
    );
  }
}

class Shipment extends ConsumerStatefulWidget {
  const Shipment({super.key, this.location, this.capacity});
  final location;
  final capacity;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShipmentState();
}

class _ShipmentState extends ConsumerState<Shipment> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 84,
        width: MediaQuery.of(context).size.width - (16 * 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Palette.neutralBlack,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Icon(
                    Icons.warehouse,
                    color: Palette.primaryColor,
                    size: 38,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.location
                            .toString()
                            .substring(0, widget.location.length - 3),
                        style: titleMedium(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "Capacity : ${widget.capacity}",
                          style: bodyMedium(fontColor: Palette.neutralGrey),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 16.0,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 14.0),
                    child: Text(
                      "View More",
                      style: bodySmall(),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
