// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Config/api_integration.dart';
import 'package:globaldispatch/Riverpod/riverpod_variables.dart';
import 'package:globaldispatch/Routing/route_names.dart';
import 'package:globaldispatch/Screens/Widgets/auth_heading.dart';
import 'package:globaldispatch/Screens/Widgets/form_errors.dart';
import 'package:globaldispatch/Screens/Widgets/log_in_button.dart';
import 'package:globaldispatch/Screens/Widgets/logo_with_name.dart';
import 'package:globaldispatch/Screens/Widgets/name_text_area.dart';
import 'package:globaldispatch/static_classes.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';

class AddBusinessDetails extends ConsumerWidget {
  AddBusinessDetails({
    super.key,
  });

  final businessNameArea = NameTextArea(
    labelText: "Password",
    hintText: "Atleast 8 characters",
  );

  final ErrorLines buinessErrorLines = ErrorLines(
    errorProvider: addBusinessNameErrorProvider,
    height: 35,
  );

  final ownerNameArea = NameTextArea(
    labelText: "Password",
    hintText: "Atleast 8 characters",
  );

  final ErrorLines ownerNameErrorLines = ErrorLines(
    errorProvider: addBusinessOwnerNameErrorProvider,
    height: 35,
  );
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                const SizedBox(height: 112),
                authHeading("Set Password"),
                const SizedBox(height: 44),
                businessNameArea,
                const SizedBox(height: 4),
                buinessErrorLines,
                const SizedBox(height: 16),
                ownerNameArea,
                const SizedBox(height: 4),
                ownerNameErrorLines,
                const SizedBox(height: 12),
                LogInButton(
                  loaderProvider: addBusinessDetailsButtonLoaderProvider,
                  text: "Add De",
                  function: () async {
                    if ((ref.watch(addBusinessNameErrorProvider)).isEmpty) {
                      if ((ref.watch(addBusinessOwnerNameErrorProvider))
                          .isEmpty) {
                        addBusinessDetailsButtonLoaderNotifier.toggle();
                        final response = await ApiCalls.addBusinessDetails(
                            owner_name: ownerNameArea.controller.text,
                            business_name: businessNameArea.controller.text);

                        if (response['statusCode'] == 200) {
                          context.goNamed(RouteNames.homePage);
                        } else {
                          addBusinessOwnerNameErrorNotifier
                              .setVal(response[response.keys.first][0]);
                        }

                        addBusinessDetailsButtonLoaderNotifier.toggle();
                      } else {
                        addBusinessOwnerNameErrorNotifier
                            .setVal("Add Business Name");
                      }
                    } else {
                      addBusinessNameErrorNotifier.setVal("Add Business Name");
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
