// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:globaldispatch/Riverpod/riverpod_variables.dart';
import 'package:globaldispatch/Screens/Widgets/logo_with_name.dart';
import 'package:globaldispatch/Screens/Widgets/otp_box.dart';
import 'package:toast/toast.dart';

class ForgetPassOtpPage extends StatelessWidget {
  final String email;

  const ForgetPassOtpPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assests/background.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Column(
              children: [
                const SizedBox(height: 38),
                const CenterLogo(),
                const SizedBox(height: 93),
                OtpBox(
                  loaderProvider: forgetPassOtpButtonLoaderProvider,
                  sentAt: 'email address',
                  buttonFunction: (pin) async {},
                  resendFunction: () async {
                    ToastContext().init(context);
                    forgetPassOtpButtonLoaderNotifier.toggle();

                    forgetPassOtpButtonLoaderNotifier.toggle();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
