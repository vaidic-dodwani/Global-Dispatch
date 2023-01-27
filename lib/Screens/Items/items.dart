import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/AddnewWarehouse/services.dart';
import 'package:globaldispatch/Screens/HomePage/provider.dart';
import 'package:globaldispatch/Screens/Items/services.dart';
import 'package:globaldispatch/Screens/WarehousePage/provider.dart';
import 'package:globaldispatch/Screens/Widgets/dropdown_button.dart';
import 'package:globaldispatch/Screens/Widgets/email_text_area.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';
import 'package:globaldispatch/static_classes.dart';
import 'package:toast/toast.dart';

class ItemsAdd extends ConsumerStatefulWidget {
  const ItemsAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemsAddState();
}

class _ItemsAddState extends ConsumerState<ItemsAdd> {
  final locationArea = EmailTextArea(
    labelText: "Name",
    hintText: "Enter Item Name",
  );

  final capacity = LocationTextArea(
    hintText: "Enter Quantity ",
    labelText: "Quantity",
  );
  final volume = LocationTextArea(
    hintText: "Enter Volume per Item ",
    labelText: "Volume",
  );

  int cap = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            User.businessName ?? "",
            style: titleLarge(),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 200,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 16, bottom: 16),
                  child: Text(
                    "Enter Name :",
                    style: titleMedium(),
                  ),
                ),
                locationArea,
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16),
                  child: Text(
                    "Enter Quantity :",
                    style: titleMedium(),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 24.0), child: capacity),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16),
                  child: Text(
                    "Enter Volume :",
                    style: titleMedium(),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 24.0), child: volume),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropDownWidget(),
                )
              ]),
        ),
        bottomNavigationBar: ElevatedButton(
            onPressed: () async {
              if (locationArea.controller.text.isEmpty ||
                  capacity.controller.text.isEmpty) return;
              NewItem_services api = NewItem_services();
              // String name, int quantity, int volume, int id, int catog
              var res = await api.additem(
                  locationArea.controller.text,
                  int.parse(capacity.controller.text),
                  int.parse(volume.controller.text),
                  ref.watch(warehouseid),
                  2);
              ToastContext().init(context);

              if (res) {
                Toast.show("Warehouse Created",
                    duration: 5, gravity: Toast.bottom);
                ref.refresh(warehouseitemdata);
                ref.refresh(warehousePage_data);
                Navigator.pop(context);
              } else {
                Toast.show("Warehouse do not have enough space",
                    duration: 5, gravity: Toast.bottom);
              }
            },
            child:
                Container(height: 56, child: Center(child: Text("Add Item")))));
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
