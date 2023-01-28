import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/Shipment/provider.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';
import 'package:globaldispatch/Screens/Widgets/warehouse.dart';
import 'package:globaldispatch/static_classes.dart';
import 'package:go_router/go_router.dart';

class Shipment extends ConsumerStatefulWidget {
  const Shipment({super.key, this.id});
  final id;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShipmentState();
}

class _ShipmentState extends ConsumerState<Shipment> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(shipment_data);
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Choose the Warehouse",
              style: titleMedium(),
            ),
            Expanded(
                child: data.when(
              data: (data) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Redirects.shipmentDestinationId = data[index]['id'];
                        context.go("/homepage/bwarehouse");
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Warehouse(
                          location: data[index]["location"],
                          capacity: data[index]["max_capacity"],
                        ),
                      ),
                    );
                  },
                );
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ))
          ]),
        ),
      ),
    );
  }
}
