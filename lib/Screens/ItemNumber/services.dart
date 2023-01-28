import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:globaldispatch/static_classes.dart';

class ItemNum {
  getPrediction(int source, int destination, int quantity, int commodity,
      String location) async {
    Dio dio = Dio();
    String token = App.acesss ?? "";
    String endpoint = "http://20.207.198.132/business/shipment/";
    dio.options.headers["Authorization"] = "Bearer ${token}";
    Response res;
    if (location.isEmpty) {
      res = await dio.post(endpoint,
          data: {
            "destination": destination,
            "quantity": quantity,
            "source": source,
            "commodity": commodity
          },
          options: Options(
            validateStatus: (status) => true,
          ));
    } else {
      res = await dio.post(endpoint,
          data: {
            "destination_country": location,
            "quantity": quantity,
            "source": source,
            "commodity": commodity
          },
          options: Options(
            validateStatus: (status) => true,
          ));
    }
    log(res.toString());
    if (res.statusCode == 201) {
      return {"msg": true, "data": res.data};
    } else {
      return {"msg": false, "data": res.data};
    }
  }
}
