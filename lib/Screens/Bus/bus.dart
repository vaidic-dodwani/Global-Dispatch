import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Routing/route_names.dart';
import 'package:globaldispatch/Screens/Bus/provider.dart';
import 'package:globaldispatch/Screens/Shipment/provider.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';
import 'package:go_router/go_router.dart';

class Bus extends ConsumerStatefulWidget {
  const Bus({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BusState();
}

class _BusState extends ConsumerState<Bus> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(business_data);
    return SizedBox(
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Create Your Shipment",
            style: titleLarge(),
          ),
          Expanded(
              child: data.when(
            data: (data) {
              log(data.toString());
              return ListView.builder(
                itemCount: data.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return GestureDetector(
                      onTap: () {
                        context.go("/homepage/customer");
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Business(
                          name: "Customer",
                          owner: "",
                        ),
                      ),
                    );
                  }
                  return GestureDetector(
                    onTap: (() {
                      ref.watch(busid.notifier).state = data[index - 1]["id"];
                      context.goNamed(RouteNames.shipment,
                          params: {"id": data[index - 1]["id"].toString()});
                    }),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Business(
                        name: data[index - 1]["name"],
                        owner: data[index - 1]["owner_name"],
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
    );
  }
}

class Business extends ConsumerStatefulWidget {
  const Business({super.key, this.name, this.owner});
  final name;
  final owner;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BusinessState();
}

class _BusinessState extends ConsumerState<Business> {
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
                        "${widget.name}",
                        style: titleMedium(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "${widget.owner}",
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
