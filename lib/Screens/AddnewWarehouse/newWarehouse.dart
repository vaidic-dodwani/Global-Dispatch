import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/Widgets/email_text_area.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';

class NewWarehouse extends ConsumerStatefulWidget {
  const NewWarehouse({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewWarehouseState();
}

class _NewWarehouseState extends ConsumerState<NewWarehouse> {
  final locationArea = EmailTextArea(
    labelText: "Location",
    hintText: "Enter Warehouse Location",
  );

  final capacity = EmailTextArea(
    labelText: "Maximum Capacity",
    hintText: "Enter Maximum Capacity",
  );

  int cap = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Buisness Name",
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
              locationArea,
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16),
                child: Text(
                  "Enter Maximum Capacity :",
                  style: titleMedium(),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: LocationTextArea(
                    hintText: "Enter Maximum Capacity",
                    labelText: "Maximum Capacity",
                  )),
            ]),
        bottomNavigationBar: ElevatedButton(
            onPressed: () {},
            child: Container(
                height: 56, child: Center(child: Text("Add Warehouse")))));
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
