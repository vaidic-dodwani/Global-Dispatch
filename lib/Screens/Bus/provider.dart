import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/Bus/services.dart';

final business_data = FutureProvider(
  (ref) {
    return ref.watch(bus_sevices).getBus();
  },
);
