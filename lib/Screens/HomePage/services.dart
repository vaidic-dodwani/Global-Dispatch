import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Warehouse_services {
  getWarehouse() async {
    Dio dio = Dio();
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc3NDM0MDk3LCJpYXQiOjE2NzQ4NDIwOTcsImp0aSI6IjQ0OWRhMGUzNDdmZTRiZTliYjE3MTM4MGI0ZjA5NzA5IiwidXNlcl9pZCI6MX0.jw2tdWxtrbR0qVpcO-mgdcBLJBVOO0Uc-q5wkngW47o";
    String endpoint = "http://20.207.198.132/business/warehouse/";
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
