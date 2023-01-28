// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Riverpod/riverpod_variables.dart';
import 'package:globaldispatch/Screens/Bus/bus.dart';
import 'package:globaldispatch/Screens/HomePage/AdminPages/admin_home_tab.dart';
import 'package:globaldispatch/Screens/HomePage/AdminPages/admin_transaction_history.dart';
import 'package:globaldispatch/Screens/HomePage/home_tab.dart';
import 'package:globaldispatch/Screens/HomePage/transaction_history.dart';
import 'package:globaldispatch/Screens/Widgets/admin_home_app_bar.dart';
import 'package:globaldispatch/Screens/Widgets/admin_home_bottom_nav.dart';
import 'package:globaldispatch/Screens/Widgets/home_app_bar.dart';
import 'package:globaldispatch/Screens/Widgets/home_bottom_nav.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';
import 'package:globaldispatch/static_classes.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Palette.secondaryBlackColor,
      appBar: User.admin ?? false ? adminHomeAppBar() : homeAppBar(),
      body: Stack(
        children: [
          User.admin ?? false
              ? adminPageWidgets[ref.watch(homeBottomNavProvider)]
              : homePageWidgets[ref.watch(homeBottomNavProvider)],
          User.admin ?? false
              ? const AdminHomeBottomNavBar()
              : const HomeBottomNavBar(),
        ],
      ),
    );
  }
}

List<Widget> homePageWidgets = [
  const HomeTab(),
  const Bus(),
  const TransactionHistory(),
];

List<Widget> adminPageWidgets = [
  const AdminHomeTab(),
  const AdminTransactionHistory(),
];
