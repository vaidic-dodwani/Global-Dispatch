import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/static_classes.dart';

class Warehouse_services {
  getWarehouse() async {
    Dio dio = Dio();
    String token = App.acesss ?? "";  String endpoint = "http://20.207.198.132/business/warehouse/";
    dio.options.headers["Authorization"] = "Bearer ${token}";
    // dio.options.headers["Authorization"] = "Bearer ${App.acesss}";
    Response res = await dio.get(endpoint);
    if (res.statusCode == 200) {
      return res.data;
    }
  }
}

final warehouse_services = Provider(
  (ref) => Warehouse_services(),
);
