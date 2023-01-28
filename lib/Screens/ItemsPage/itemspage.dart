import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/ItemNumber/itemnumber.dart';
import 'package:globaldispatch/Screens/WarehousePage/customWidget.dart';
import 'package:globaldispatch/Screens/WarehousePage/provider.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';
import 'package:globaldispatch/static_classes.dart';

class ItemsPage extends ConsumerStatefulWidget {
  const ItemsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemsPageState();
}

class _ItemsPageState extends ConsumerState<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(warehouseitemdata);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose Your Item",
                style: titleMedium(),
              ),
              Expanded(
                child: data.when(
                  data: (data) {
                    log(data.toString());
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap: () {
                                Redirects.shipmentSelectedItemId =
                                    data[index]['id'];

                                // ref.watch(warehouseid.notifier).state =
                                //     data[index]["id"];
                                // context.go(
                                //     "/homepage/bwarehouse/itemspage");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ItemNumber(
                                          cap: data[index]["quantity"]),
                                    ));
                              },
                              child: Item(
                                name: data[index]["name"],
                                catog: data[index]["category"]["name"],
                                quantity: data[index]["quantity"],
                                volume: data[index]["volume"],
                              )),
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) {
                    return Text(error.toString());
                  },
                  loading: () => Center(child: CircularProgressIndicator()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
