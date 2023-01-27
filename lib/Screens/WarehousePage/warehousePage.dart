import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';

class WarehousePage extends ConsumerStatefulWidget {
  const WarehousePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WarehousePageState();
}

class _WarehousePageState extends ConsumerState<WarehousePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.warehouse,
          color: Palette.primaryColor,
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          "Location, India",
          style: titleLarge(),
        ),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Max Capacity: ",
                          style: titleMedium(),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "${100} m3",
                          style: titleMedium(fontColor: Palette.primaryColor),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          Text(
                            "Current Capacity: ",
                            style: titleMedium(),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "${50} m3",
                            style: titleMedium(fontColor: Palette.primaryColor),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                // width: MediaQuery.of(context).size.width * 0.3,
                child: Container(
                  height: 200,
                  width: 50,
                  child: Container(
                    color: Colors.amber,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
