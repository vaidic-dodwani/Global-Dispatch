import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/HomePage/provider.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';
import 'package:globaldispatch/Screens/Widgets/warehouse.dart';
import 'package:go_router/go_router.dart';

import '../WarehousePage/provider.dart';

class BWarehouse extends ConsumerStatefulWidget {
  const BWarehouse({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BWarehouseState();
}

class _BWarehouseState extends ConsumerState<BWarehouse> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(warehouse_data);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose Your Warehouse",
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
                                ref.watch(warehouseid.notifier).state =
                                    data[index]["id"];
                                context.go(
                                    "/homepage/bwarehouse/itemspage");
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical:8.0),
                                child: Warehouse(
                                  location: (data[index]["location"].length > 12)
                                      ? data[index]["location"]
                                              .toString()
                                              .substring(0, 12) +
                                          "..."
                                      : data[index]["location"],
                                  capacity: data[index]["max_capacity"] -
                                      data[index]["present_capacity"],
                                ),
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
