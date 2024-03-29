// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/HomePage/provider.dart';
import 'package:globaldispatch/Screens/WarehousePage/provider.dart';
import 'package:globaldispatch/Screens/Widgets/auth_heading.dart';
import 'package:globaldispatch/Screens/Widgets/warehouse.dart';
import 'package:go_router/go_router.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(warehouse_data);

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                authTitleMediumText("Your Warehouse"),
                ElevatedButton(
                    onPressed: () {
                      context.go("/homepage/newwarehouse");
                    },
                    child: const Text("Add New Warehouse"))
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
                child: data.when(
              data: (data) {
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
                                "/homepage/warehousePage?id=${data[index]["id"]}");
                          },
                          child: Warehouse(
                            location: (data[index]["location"].length > 12)
                                ? "${data[index]["location"]
                                        .toString()
                                        .substring(0, 12)}..."
                                : data[index]["location"],
                            capacity: data[index]["max_capacity"] -
                                data[index]["present_capacity"],
                          )),
                    );
                  },
                );
              },
              error: (error, stackTrace) {
                return Text(error.toString());
              },
              loading: () => const Center(child: CircularProgressIndicator()),
            ))
          ],
        ),
      ),
    );
  }
}
