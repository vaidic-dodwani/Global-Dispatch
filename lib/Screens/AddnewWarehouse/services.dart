import 'dart:developer';

import 'package:dio/dio.dart';

import '../../static_classes.dart';

class NewWarehouse_service {
  addWarehouse(String location, int cap) async {
    Dio dio = Dio();
    String token = App.acesss ?? "";
    String endpoint = "http://20.207.198.132/business/warehouse/";
    dio.options.headers["Authorization"] = "Bearer ${token}";
    Response res = await dio
        .post(endpoint, data: {"max_capacity": cap, "location": location});
    if (res.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  getWarehouse() async {
    Dio dio = Dio();
    String token = App.acesss ?? "";
    String endpoint = "http://20.207.198.132/business/warehouse/";
    log(token);
    dio.options.headers["Authorization"] = "Bearer ${token}";
    // dio.options.headers["Authorization"] = "Bearer ${App.acesss}";
    Response res = await dio.get(endpoint);
    if (res.statusCode == 200) {
      return res.data;
    }
  }
}
