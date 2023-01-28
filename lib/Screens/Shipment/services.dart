import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/static_classes.dart';

class Shipment_services {
  getallWarehouse(int id) async {
    Dio dio = Dio();
    String token = App.acesss ?? "";
    String endpoint = "http://20.207.198.132/business/getwarehouse/?bus=${id}";
    dio.options.headers["Authorization"] = "Bearer ${token}";
    // dio.options.headers["Authorization"] = "Bearer ${App.acesss}";
    Response res = await dio.get(endpoint);
    if (res.statusCode == 200) {
      return res.data;
    }
  }
}

final shipment_services = Provider(
  (ref) => Shipment_services(),
);
