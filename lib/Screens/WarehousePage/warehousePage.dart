import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/Items/items.dart';
import 'package:globaldispatch/Screens/WarehousePage/customWidget.dart';
import 'package:globaldispatch/Screens/WarehousePage/provider.dart';
import 'package:globaldispatch/Screens/Widgets/dropdown_button.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';
import 'package:go_router/go_router.dart';

class WarehousePage extends ConsumerStatefulWidget {
  WarehousePage({super.key, this.id});
  final id;
  final dropDown = DropDownWidget();
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WarehousePageState();
}

class _WarehousePageState extends ConsumerState<WarehousePage> {
  int max = 100;
  int curr = 60;

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(warehousePage_data);
    final items_data = ref.watch(warehouseitemdata);
    int categoryId = ref.watch(filterProvider);
    return data.when(
      data: (data) {
        max = data["max_capacity"];
        curr = data["present_capacity"];
        return Scaffold(
          floatingActionButton: FloatingActionButton(
              backgroundColor: Palette.primaryColor,
              onPressed: () {
                context.go("/homepage/warehousePage/items");
              },
              child: const Icon(
                Icons.add,
              )),
          appBar: AppBar(
            leading: const Icon(
              Icons.warehouse,
              color: Palette.primaryColor,
            ),
            backgroundColor: Colors.transparent,
            title: Text(
              "${data["location"]}",
              style: titleLarge(),
            ),
            elevation: 0,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Max Capacity: ",
                                    style: titleMedium(),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      "${max} m3",
                                      style: titleMedium(
                                          fontColor: Palette.primaryColor),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Current Capacity: ",
                                      style: titleMedium(),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      "${max - curr} m3",
                                      style: titleMedium(
                                          fontColor: Palette.primaryColor),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Center(
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: 200,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      color: Palette.neutralGrey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(200))),
                                ),
                                Container(
                                  height:
                                      ((((curr / (max)) * 100).floor() + 0.0) /
                                              100) *
                                          200,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    color: Palette.primaryColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(200),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Items",
                  style: titleLarge(),
                  textAlign: TextAlign.start,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Filter By:",
                    style: titleMedium(),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: dropDown),
                ],
              ),
              Expanded(
                  child: items_data.when(
                data: (data) {
                  log(data.toString());
                  List<Map<dynamic, dynamic>> filtered = [];

                  data.forEach((element) {
                    if (element['category']['id'] == categoryId) {
                      filtered.add(element);
                    }
                  });
                  return ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      return Item(
                        name: filtered[index]["name"],
                        catog: filtered[index]["category"]["name"],
                        quantity: filtered[index]["quantity"],
                        volume: filtered[index]["volume"],
                      );
                    },
                  );
                },
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ))
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        log(stackTrace.toString());
        return Text(error.toString());
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
