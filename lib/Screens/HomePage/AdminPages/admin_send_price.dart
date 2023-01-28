import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Config/api_integration.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              onPressed: () async {
                final output = await ApiCalls.finalPrice(
                    shipId: shipId, price: predictedPrice);
                if (output['statusCode'] == 200) {
                  context.pop();
                } else {
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
