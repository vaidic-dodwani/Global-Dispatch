import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/Shipment/services.dart';

final shipment_data = FutureProvider(
  (ref) {
    int id = ref.watch(busid);
    return ref.watch(shipment_services).getallWarehouse(id);
  },
);

final busid = StateProvider(
  (ref) => -1,
);
