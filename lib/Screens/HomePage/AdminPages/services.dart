import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/static_classes.dart';

class admin_home {
  getadmin() async {
    Dio dio = Dio();
    String token = App.acesss ?? "";
    String endpoint = "http://20.207.198.132/business/adm/ShipmentApproval/";
    dio.options.headers["Authorization"] = "Bearer ${token}";
    // dio.options.headers["Authorization"] = "Bearer ${App.acesss}";
    Response res = await dio.get(endpoint);
    if (res.statusCode == 200) {
      return res.data;
    }
  }
}


final admin_home_services = Provider((ref) => admin_home());