import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';

PreferredSize homeAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(73),
    child: Consumer(
      builder: (context, ref, child) => AppBar(
        elevation: 0,
        leadingWidth: 68,
        backgroundColor: Palette.secondaryBlackColor,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 24,
            backgroundImage: AssetImage("assests/logo/logo.png"),
          ),
        ),
        title: Text(
          "asdasdss",
          style: bodyMedium(),
        ),
      ),
    ),
  );
}
