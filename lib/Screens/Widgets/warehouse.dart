import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';

class Warehouse extends ConsumerStatefulWidget {
  const Warehouse({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WarehouseState();
}

class _WarehouseState extends ConsumerState<Warehouse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 84,
          width: MediaQuery.of(context).size.width - (16 * 2),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(5, 5), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(8),
            color: Palette.neutralBlack,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
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
                          "Location, India",
                          style: titleMedium(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            "Capacity : ${10}",
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
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 10,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
