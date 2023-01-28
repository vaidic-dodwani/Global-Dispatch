// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:globaldispatch/Config/api_functions.dart';
import 'package:globaldispatch/Config/api_integration.dart';
import 'package:globaldispatch/Riverpod/riverpod_variables.dart';
import 'package:globaldispatch/Routing/route_names.dart';
import 'package:globaldispatch/Screens/Widgets/logo_with_name.dart';
import 'package:globaldispatch/Screens/Widgets/otp_box.dart';
import 'package:globaldispatch/static_classes.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class OtpPage extends StatelessWidget {
  final String email;

  const OtpPage({super.key, required this.email});

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
                  buttonFunction: (pin) async {
                    forgetPassOtpButtonLoaderNotifier.toggle();
                    final response =
                        await ApiCalls.verifyEmailOTP(email: email, otp: pin);
                    if (response['statusCode'] == 200) {
                      final sigUpRes = await ApiCalls.signUp(
                          email: email, password: User.password!);
                      final prefs = await SharedPreferences.getInstance();

                      App.acesss = sigUpRes['tokens']['access'];
                      
                      prefs.setString("access", App.acesss!);
                      context.goNamed(RouteNames.businessDetails,
                          params: {'email': email});
                    } else {
                      ToastContext().init(context);
                      Toast.show(response[response.keys.first][0],
                          duration: 5, gravity: Toast.bottom);
                    }

                    forgetPassOtpButtonLoaderNotifier.toggle();
                  },
                  resendFunction: () async {
                    ToastContext().init(context);
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
