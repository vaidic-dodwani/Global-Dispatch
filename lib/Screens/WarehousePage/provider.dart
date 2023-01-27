import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/WarehousePage/services.dart';
import 'package:globaldispatch/Screens/WarehousePage/warehousePage.dart';

final warehousePage_data = FutureProvider((ref) {
  int id = ref.watch(warehouseid);
  return ref.watch(warehousePage_services).getwarehouseData(id);
},);

final warehouseitemdata = FutureProvider((ref) {
  int id = ref.watch(warehouseid);
  return ref.watch(warehousePage_services).getitems(id);
},);

final warehouseid = StateProvider((ref) => -1,);