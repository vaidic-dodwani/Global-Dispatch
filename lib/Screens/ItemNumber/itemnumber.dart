import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';

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
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ElevatedButton(
            onPressed: () {},
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
