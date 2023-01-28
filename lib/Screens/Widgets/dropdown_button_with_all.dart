import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/WarehousePage/provider.dart';

class WithAll extends ConsumerStatefulWidget {
  WithAll({super.key});
  List<String> itemsWithAll = [
    'All',
    'Meat and edible meat offal',
    'Fish crustaceans molluscs aquatic invertebrates ne',
    'Dairy products eggs honey edible animal product nes',
    'Products of animal origin nes',
    'Live trees plants bulbs roots cut flowers etc',
    'Edible vegetables and certain roots and tubers',
    'Edible fruit nuts peel of citrus fruit melons',
    'Coffee tea mate and spices',
    'Cereals',
    'Milling products malt starches inulin wheat glute',
    'Oil seed oleagic fruits grain seed fruit etc ne'
  ];
  int selected = 0;
  int id = 0;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WithAllState();
}

class _WithAllState extends ConsumerState<WithAll> {
  @override
  Widget build(BuildContext context) {
    log("list${widget.itemsWithAll}");
    return DropdownButton(
      value: widget.itemsWithAll[widget.selected],
      isExpanded: true,
      items: widget.itemsWithAll.map(
        (String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        },
      ).toList(),
      onChanged: (value) {
        setState(() {
          widget.selected = widget.itemsWithAll.indexOf(value!);

          if (widget.selected == 0) {
            widget.id = 0;
          }

          widget.id = widget.selected + 2;
        });
        ref.watch(filterProvider.notifier).state = widget.id;
      },
    );
  }
}
