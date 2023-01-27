import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/HomePage/services.dart';


final warehouse_data = FutureProvider(
  (ref) {
    return ref.watch(warehouse_services).getWarehouse();
  },
);
