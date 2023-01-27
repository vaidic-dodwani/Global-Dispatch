import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';

class Item extends ConsumerStatefulWidget {
  const Item({super.key, this.name, this.catog, this.quantity, this.volume});
  final name;
  final catog;
  final quantity;
  final volume;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemState();
}

class _ItemState extends ConsumerState<Item> {
  String name =
      "Name nameName nameName nameName nameName nameName nameName name";
  String catog = "Catog CatogCatog CatogCatog CatogCatog Catog";
  @override
  Widget build(BuildContext context) {
    name = widget.name;
    catog = widget.catog.toString();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Container(
          height: 72 * 1.5,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: const BoxDecoration(
              color: Palette.neutralBlack,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.inventory,
                      color: Palette.primaryColor,
                      size: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Text(
                            (name.length > 18)
                                ? name.substring(0, 18) + "..."
                                : name,
                            style: bodyMedium(),
                          )),
                          Container(
                              child: Text(
                            (catog.length > 18)
                                ? catog.substring(0, 18) + "..."
                                : catog,
                            style: bodySmall(fontColor: Palette.neutralGrey),
                          ))
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Quantity: ${widget.quantity}"),
                    Text(
                      "${widget.volume} m3",
                      style: bodySmall(),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
