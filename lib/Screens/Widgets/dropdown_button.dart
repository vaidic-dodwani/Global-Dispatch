import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/WarehousePage/provider.dart';

class DropDownWidget extends ConsumerStatefulWidget {
  DropDownWidget({super.key});
  var items = [
    'Meat and edible meat offal',
    'Fish crustaceans molluscs aquatic invertebrates ne',
    'Dairy products eggs honey edible animal product nes',
    'Products of animal origin nes',
    'Live trees plants bulbs roots cut flowers etc',
    'Edible vegetables and certain roots and tubers',
    'Edible fruit nuts peel of citrus fruit melons',
    "Coffee tea mate and spices",
    "Cereals",
    "Milling products malt starches inulin wheat glute",
    'Oil seed oleagic fruits grain seed fruit etc ne'
  ];
  int selected = 0;
  int id = 2;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends ConsumerState<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: widget.items[widget.selected],
      isExpanded: true,
      items: widget.items.map(
        (String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        },
      ).toList(),
      onChanged: (value) {
        setState(() {
          widget.selected = widget.items.indexOf(value!);
          widget.id = widget.selected + 2;
        });
        ref.watch(filterProvider.notifier).state = widget.id;
      },
    );
  }
}

class DropDownWidgetWithAll extends ConsumerStatefulWidget {
  DropDownWidgetWithAll({super.key});
  var itemsWithAll = [
    "All",
    'Meat and edible meat offal',
    'Fish crustaceans molluscs aquatic invertebrates ne',
    'Dairy products eggs honey edible animal product nes',
    'Products of animal origin nes',
    'Live trees plants bulbs roots cut flowers etc',
    'Edible vegetables and certain roots and tubers',
    'Edible fruit nuts peel of citrus fruit melons',
    "Coffee tea mate and spices",
    "Cereals",
    "Milling products malt starches inulin wheat glute",
    'Oil seed oleagic fruits grain seed fruit etc ne'
  ];
  int selected = 0;
  int id = 0;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DropDownWidgetWithAllState();
}

class _DropDownWidgetWithAllState extends ConsumerState<DropDownWidgetWithAll> {
  @override
  Widget build(BuildContext context) {
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
