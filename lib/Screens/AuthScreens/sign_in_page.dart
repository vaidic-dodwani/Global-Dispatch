// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Config/api_functions.dart';
import 'package:globaldispatch/Config/api_integration.dart';
import 'package:globaldispatch/Riverpod/riverpod_variables.dart';
import 'package:globaldispatch/Routing/route_names.dart';
import 'package:globaldispatch/Screens/AuthScreens/track.dart';
import 'package:globaldispatch/Screens/AuthScreens/track/provider.dart';
import 'package:globaldispatch/Screens/Widgets/auth_heading.dart';
import 'package:globaldispatch/Screens/Widgets/email_text_area.dart';
import 'package:globaldispatch/Screens/Widgets/form_errors.dart';
import 'package:globaldispatch/Screens/Widgets/log_in_button.dart';
import 'package:globaldispatch/Screens/Widgets/logo_with_name.dart';
import 'package:globaldispatch/Screens/Widgets/password_text_area.dart';
import 'package:globaldispatch/Screens/Widgets/sign_in_up_tabs.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';
import 'package:globaldispatch/static_classes.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends ConsumerWidget {
  SignInPage({super.key});

  final EmailTextArea emailField = EmailTextArea(
      labelText: "Email Address",
      hintText: "Enter Email",
      emailErrorNotifier: signInEmailErrorNotifer);

  final PasswordTextArea passwordField = PasswordTextArea(
    labelText: "Password",
    hintText: "  At least 8 characters.",
    passErrorNotifier: signInPasswordErrorNotifer,
  );
  final ErrorLines emailError = ErrorLines(
    errorProvider: signInEmailErrorProvider,
  );
  final ErrorLines passError = ErrorLines(
    errorProvider: signInPasswordErrorProvider,
    height: 32,
  );
  final shipid = EmailTextArea(
      labelText: "Shipment ID", hintText: "Enter your Shipment ID");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(children: [
          Image.asset(
            "assests/background.png",
            height: size.height,
            width: size.width,
          ),
          Column(
            children: [
              const SizedBox(height: 38),
              const CenterLogo(),
              const SizedBox(height: 40),
              const SignInUpTabs(choice: 0),
              const SizedBox(height: 36),
              authHeading("Welcome, Back"),
              const SizedBox(height: 24),
              emailField,
              const SizedBox(height: 4),
              emailError,
              const SizedBox(height: 12),
              passwordField,
              const SizedBox(height: 4),
              passError,
              const SizedBox(height: 16),
              LogInButton(
                text: "Login",
                loaderProvider: signInButtonLoaderProvider,
                function: () async {
                  if (signInEmailErrorNotifer.valid &&
                      signInPasswordErrorNotifer.valid) {
                    signInButtonLoaderNotifier.toggle();
                    final response = await ApiCalls.signIn(
                        email: emailField.controller.text,
                        password: passwordField.controller.text);
                    if (response['statusCode'] == 200) {
                      App.acesss = response['tokens']['access'];
                      final prefs = await SharedPreferences.getInstance();
                      log(App.acesss!);
                      prefs.setString('access', App.acesss!);
                      App.isLoggedIn = true;

                      if (emailField.controller.text.toLowerCase().trim() ==
                          "suhaillahmadd0@gmail.com") {
                        log("adminnnnnnnnnnnn");
                        User.admin = true;
                        prefs.setBool("admin", true);
                      }

                      final output = await ApiCalls.getUserDetails();
                      await userDetailsInit(output);

                      context.goNamed(RouteNames.homePage);
                    } else {
                      signInPasswordErrorNotifer
                          .setVal(response[response.keys.first]);
                    }
                    signInButtonLoaderNotifier.toggle();
                  }
                },
              ),
              const SizedBox(height: 20),
              Text(
                "or\n Track Your Shipment",
                style: bodyMedium(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              shipid,
              const SizedBox(height: 20),
              // ElevatedButton(onPressed: () {}, child: Text("Track",style: ,))
              TextButton(
                onPressed: () {
                  if (shipid.controller.text.isEmpty) {
                    return;
                  }
                  ref.watch(shipidprov.notifier).state = shipid.controller.text;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Track(),
                      ));
                },
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Palette.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    width: MediaQuery.of(context).size.width - 30,
                    height: 48,
                    child: Center(
                        child: Text(
                      "Track",
                      style: titleMedium(fontColor: Palette.primaryColor),
                    ))),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
