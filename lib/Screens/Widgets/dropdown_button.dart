import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget({super.key});
  int id = 2;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

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

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: items[selected],
      isExpanded: true,
      items: items.map(
        (String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        },
      ).toList(),
      onChanged: (value) {
        setState(() {
          selected = items.indexOf(value!);
          widget.id = selected + 2;
        });
      },
    );
  }
}
