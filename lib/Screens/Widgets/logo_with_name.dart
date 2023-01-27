import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';

class CenterLogo extends StatelessWidget {
  const CenterLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset(
            "assests/logo/logo.png",
            width: 24,
            height: 24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text("Global Dispatch",
              style: titleMedium(fontColor: Palette.primaryColor)),
        )
      ],
    );
  }
}
