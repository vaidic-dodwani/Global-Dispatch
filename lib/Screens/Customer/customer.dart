// ignore_for_file: use_build_context_synchronously

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_cupertino.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/AddnewWarehouse/services.dart';
import 'package:globaldispatch/Screens/HomePage/provider.dart';
import 'package:globaldispatch/Screens/Widgets/email_text_area.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';
import 'package:globaldispatch/static_classes.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';

class Customer extends ConsumerStatefulWidget {
  const Customer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomerState();
}

class _CustomerState extends ConsumerState<Customer> {
  final locationArea = EmailTextArea(
    labelText: "Location",
    hintText: "Enter Warehouse Location",
  );

  final capacity = LocationTextArea(
    hintText: "Enter Maximum Capacity",
    labelText: "Maximum Capacity",
  );
  Country? _selectedCupertinoCountry;
  int cap = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Customer Details",
            style: titleLarge(),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 200,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 16),
                child: Text(
                  "Enter Location :",
                  style: titleMedium(),
                ),
              ),
              TextButton(
                onPressed: () => showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return CountryPickerCupertino(
                        pickerSheetHeight: 300.0,
                        onValuePicked: (Country country) =>
                            setState(() => _selectedCupertinoCountry = country),
                        priorityList: [
                          CountryPickerUtils.getCountryByIsoCode('TR'),
                          CountryPickerUtils.getCountryByIsoCode('US'),
                        ],
                      );
                    }),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pick Country :"),
                    Text(_selectedCupertinoCountry?.name ?? "")
                  ],
                ),
              ),
            ]),
        bottomNavigationBar: ElevatedButton(
            onPressed: () async {
              Redirects.shipmentDestinationLocation =
                  _selectedCupertinoCountry!.name +
                      _selectedCupertinoCountry!.iso3Code;
              context.go("/homepage/bwarehouse");
            },
            child: const SizedBox(
                height: 56, child: Center(child: Text("Next")))));
  }
}

class LocationTextArea extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller = TextEditingController();
  final Color fontColor = Colors.black;

  LocationTextArea({
    super.key,
    required this.labelText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
          onChanged: (text) {},
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          controller: controller,
          keyboardType: TextInputType.number,
          style: bodyMedium(),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: bodyMedium(),
            labelText: labelText,
            hintText: hintText,
            labelStyle: labelMedium(),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: Palette.secondaryOffWhiteColor, width: 2)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: Palette.secondaryOffWhiteColor, width: 2)),
            disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: Palette.secondaryOffWhiteColor, width: 2)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: Palette.secondaryOffWhiteColor, width: 2)),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: Palette.secondaryOffWhiteColor, width: 2)),
          )),
    );
  }
}
