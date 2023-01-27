import 'dart:developer';

import 'package:dio/dio.dart';

import '../../static_classes.dart';

class NewItem_services {
  additem(String name, int quantity, int volume, int id, int catog) async {
    Dio dio = Dio();
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc3NDM0MDk3LCJpYXQiOjE2NzQ4NDIwOTcsImp0aSI6IjQ0OWRhMGUzNDdmZTRiZTliYjE3MTM4MGI0ZjA5NzA5IiwidXNlcl9pZCI6MX0.jw2tdWxtrbR0qVpcO-mgdcBLJBVOO0Uc-q5wkngW47o";
    String endpoint = "http://20.207.198.132/business/commodity/";
    dio.options.headers["Authorization"] = "Bearer ${token}";
    Response res = await dio.post(endpoint,
        data: {
          "name": name,
          "quantity": quantity,
          "volume": volume,
          "warehouse": id,
          "category": catog
        },
        options: Options(
          validateStatus: (status) => true,
        ));
    log(res.toString());
    if (res.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
