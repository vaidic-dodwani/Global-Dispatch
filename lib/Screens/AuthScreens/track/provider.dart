import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Screens/AuthScreens/track/services.dart';

final shipidprov = StateProvider(
  (ref) => "",
);

final data_track = FutureProvider((ref){
  String hash = ref.watch(shipidprov);
  return ref.watch(track_services).track(hash);
});