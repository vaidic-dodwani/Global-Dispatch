// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';

class AdminHomeTab extends ConsumerWidget {
  const AdminHomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: Center(
          child: Text(
        "Admin Home Tab",
        style: titleLarge(),
      )),
    );
  }
}
