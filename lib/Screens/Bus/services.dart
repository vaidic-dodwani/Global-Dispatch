import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/static_classes.dart';

class Bus_sevices{
  getBus() async {
    Dio dio = Dio();
    String token = App.acesss ?? "";  String endpoint = "http://20.207.198.132/business/getallBus/";
    dio.options.headers["Authorization"] = "Bearer ${token}";
    // dio.options.headers["Authorization"] = "Bearer ${App.acesss}";
    Response res = await dio.get(endpoint);
    if (res.statusCode == 200) {
      return res.data;
    }
  }
}

final bus_sevices = Provider((ref) => Bus_sevices(),);