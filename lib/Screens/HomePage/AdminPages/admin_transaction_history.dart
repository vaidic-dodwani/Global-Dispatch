import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';

class AdminTransactionHistory extends ConsumerWidget {
  const AdminTransactionHistory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Center(
        child: Text(
          "Admin History",
          style: titleLarge(),
        ),
      ),
    );
  }
}
