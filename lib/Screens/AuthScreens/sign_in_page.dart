// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Riverpod/riverpod_variables.dart';
import 'package:globaldispatch/Screens/Widgets/auth_heading.dart';
import 'package:globaldispatch/Screens/Widgets/email_text_area.dart';
import 'package:globaldispatch/Screens/Widgets/form_errors.dart';
import 'package:globaldispatch/Screens/Widgets/log_in_button.dart';
import 'package:globaldispatch/Screens/Widgets/logo_with_name.dart';
import 'package:globaldispatch/Screens/Widgets/password_text_area.dart';
import 'package:globaldispatch/Screens/Widgets/sign_in_up_tabs.dart';

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
                      signInPasswordErrorNotifer.valid) {}
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ]),
      ),
    );
  }
}