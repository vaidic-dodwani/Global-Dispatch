import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/ItemNumber/services.dart';
import 'package:globaldispatch/Screens/Shipment/provider.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';
import 'package:globaldispatch/static_classes.dart';
import 'package:toast/toast.dart';

class ItemNumber extends ConsumerStatefulWidget {
  const ItemNumber({super.key, this.cap});
  final cap;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemNumberState();
}

class _ItemNumberState extends ConsumerState<ItemNumber> {
  int n = 0;
  @override
  Widget build(BuildContext context) {
    Redirects.shipmentSelectedItemQuantity = n;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ElevatedButton(
            onPressed: () async {
              ItemNum api = ItemNum();
              var res;
              if (Redirects.shipmentDestinationLocation == null ||
                  Redirects.shipmentDestinationLocation!.isEmpty) {
                res = await api.getPrediction(
                    Redirects.shipmentDepartureId ?? 0,
                    Redirects.shipmentDestinationId ?? 0,
                    Redirects.shipmentSelectedItemQuantity ?? 0,
                    Redirects.shipmentSelectedItemId ?? 0,
                    "");
              } else {
                res = await api.getPrediction(
                    Redirects.shipmentDepartureId ?? 0,
                    Redirects.shipmentDestinationId ?? 0,
                    Redirects.shipmentSelectedItemQuantity ?? 0,
                    Redirects.shipmentSelectedItemId ?? 0,
                    Redirects.shipmentDestinationLocation ?? "");
              }

              ToastContext().init(context);

              if (res["msg"]) {
                showGeneralDialog(
                  barrierDismissible: true,
                  barrierLabel: '',
                  barrierColor: Colors.black38,
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (ctx, anim1, anim2) => AlertDialog(
                    title: Text('Shipment Created'),
                    content: Text(
                        'Your Shipment is Created and will reach its destination soon. \n Expected Price is: \$${res["data"]["expected_price"]}'),
                    elevation: 2,
                    actions: [
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  transitionBuilder: (ctx, anim1, anim2, child) =>
                      BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
                    child: FadeTransition(
                      child: child,
                      opacity: anim1,
                    ),
                  ),
                  context: context,
                );
              } else {
                Toast.show("Error Occured, Please Verify Details",
                    duration: 5, gravity: Toast.bottom);
              }
            },
            child: Container(
                height: 56, child: Center(child: Text("Create Shipment")))),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "How Many?",
                style: titleMedium(),
              ),
              Expanded(
                  child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if ((n - 1) >= 0) {
                                    n--;
                                  }
                                });
                              },
                              child: Icon(Icons.remove)),
                          Text(
                            "$n",
                            style: titleLarge(),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if ((n + 1) <= widget.cap) {
                                    n++;
                                  }
                                });
                              },
                              child: Icon(Icons.add))
                        ]),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
