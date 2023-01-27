import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';

class Warehouse extends ConsumerStatefulWidget {
  const Warehouse({super.key, this.location, this.capacity});
  final location;
  final capacity;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WarehouseState();
}

class _WarehouseState extends ConsumerState<Warehouse> {
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
                        "${widget.location}",
                        style: titleMedium(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "Capacity : ${widget.capacity}",
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
