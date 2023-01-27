// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Riverpod/riverpod_variables.dart';
import 'package:globaldispatch/Screens/HomePage/home_tab.dart';
import 'package:globaldispatch/Screens/Widgets/home_app_bar.dart';
import 'package:globaldispatch/Screens/Widgets/home_bottom_nav.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Palette.secondaryBlackColor,
      appBar: homeAppBar(),
      body: Stack(
        children: [
          homePageWidgets[ref.watch(homeBottomNavProvider)],
          const HomeBottomNavBar(),
        ],
      ),
    );
  }
}

List<Widget> homePageWidgets = [
  const HomeTab()
  
  // const InvestTab(),
  // const WalletTab(),
  // ProfileTab()
];
