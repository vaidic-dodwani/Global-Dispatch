import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/WarehousePage/provider.dart';

class ItemsAdd extends ConsumerStatefulWidget {
  const ItemsAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemsAddState();
}

class _ItemsAddState extends ConsumerState<ItemsAdd> {
  @override
  Widget build(BuildContext context) {
    final id = ref.watch(warehouseid);

    return const Scaffold();
  }
}
