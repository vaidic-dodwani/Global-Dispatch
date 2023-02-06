// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Config/api_integration.dart';
import 'package:globaldispatch/Riverpod/riverpod_variables.dart';
import 'package:globaldispatch/Screens/HomePage/AdminPages/provider.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';

class AdminSendPrice extends ConsumerWidget {
  AdminSendPrice(
      {super.key, required this.predictedPrice, required this.shipId});
  final int predictedPrice;
  final int shipId;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Palette.secondaryBlackColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Predicted Pricing: \$$predictedPrice",
              style: bodyLarge(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextFormField(
                style: titleSmall(fontColor: Palette.neutralBlack),
                decoration: InputDecoration(
                    filled: true, fillColor: Palette.secondaryOffWhiteColor),
                controller: controller,
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final output = await ApiCalls.finalPrice(
                    shipId: shipId, price: int.parse(controller.text));
                if (output['statusCode'] == 200) {
                  ref.refresh(getBusinessTransactionHistory);
                  ref.refresh(admin_data);
                  context.pop();
                } else {
                  ref.refresh(getBusinessTransactionHistory);
                  ref.refresh(admin_data);
                  ToastContext().init(context);
                  Toast.show(output[output.keys.first][0],
                      duration: 5, gravity: Toast.bottom);
                }
              },
              child: const Text("Change Pricing"),
            )
          ],
        ),
      ),
    );
  }
}
