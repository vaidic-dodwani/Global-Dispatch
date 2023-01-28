import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/HomePage/AdminPages/services.dart';

final admin_data = FutureProvider((ref) {
  return ref.watch(admin_home_services).getadmin();
},);