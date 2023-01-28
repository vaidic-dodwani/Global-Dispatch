import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';

class AdminSendPrice extends ConsumerWidget {
  AdminSendPrice(
      {super.key, required this.predictedPrice, required this.shipId});
  final double predictedPrice;
  final String shipId;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Palette.neutralBlack,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Predicted Pricing$predictedPrice",
                style: bodyLarge(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Change Pricing"))
            ],
          ),
        ),
      ),
    );
  }
}
