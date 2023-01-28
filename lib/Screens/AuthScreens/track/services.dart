import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/static_classes.dart';

class Track_services {
  track(String hash) async {
    Dio dio = Dio();

    String endpoint = "http://20.207.198.132/business/shipment/search/";
    log(hash);
    Response res = await dio.post(endpoint,
        data: {"hash": hash},
        options: Options(
          validateStatus: (status) => true,
        ));
    log(res.statusCode.toString());
    log(res.data.toString());
    if (res.statusCode == 200) {
      return res.data;
    } else {
      return false;
    }
  }
}

final track_services = Provider(
  (ref) => Track_services(),
);
