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

class SignUpPage extends ConsumerWidget {
  SignUpPage({super.key});
  final EmailTextArea emailField = EmailTextArea(
    labelText: "Email Address",
    hintText: "Enter Email",
    emailErrorNotifier: signUpEmailErrorNotifer,
  );
  final ErrorLines emailError = ErrorLines(
    errorProvider: signUpEmailErrorProvider,
    height: 35,
  );
  final passArea = PasswordTextArea(
    labelText: "Password",
    hintText: "Atleast 8 characters",
    passErrorNotifier: signUpPasswordErrorNotifer,
  );

  final ErrorLines passErrorLines = ErrorLines(
    errorProvider: signUpPasswordErrorProvider,
    height: 35,
  );

  final confirmPassArea = PasswordTextArea(
    labelText: "Password",
    hintText: "Atleast 8 characters",
    passErrorNotifier: signUpConfirmPasswordErrorNotifer,
  );

  final ErrorLines confirmPassErrorLines = ErrorLines(
    errorProvider: signUpConfirmPasswordErrorProvider,
    height: 35,
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
              const SignInUpTabs(
                choice: 1,
              ),
              const SizedBox(height: 36),
              authHeading("Register Now"),
              const SizedBox(height: 24),
              emailField,
              emailError,
              const SizedBox(height: 16),
              passArea,
              passErrorLines,
              const SizedBox(height: 16),
              confirmPassArea,
              confirmPassErrorLines,
              const SizedBox(height: 12),
              LogInButton(
                text: "Sign Up",
                loaderProvider: signUpEmailButtonLoaderProvider,
                function: () async {
                  if (signUpEmailErrorNotifer.valid) {}
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
