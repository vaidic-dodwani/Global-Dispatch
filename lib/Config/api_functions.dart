import 'dart:developer';

import 'package:globaldispatch/Config/api_integration.dart';
import 'package:globaldispatch/static_classes.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String noInternet = "App_Error:No_Internet";

Future initAuth() async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('access')) {
    App.acesss = prefs.getString('access')!;
    final output = await ApiCalls.getUserDetails();
    log("user details$output");
    userDetailsInit(output);
    // await appInstanceInit();
    App.isLoggedIn = true;

    if (prefs.containsKey("admin")) {
      User.admin = prefs.getBool("admin");
    } else {
      User.admin = false;
    }
  } else {
    App.isLoggedIn = false;
  }
}

Future appInstanceInit() async {
  final prefs = await SharedPreferences.getInstance();
}

Future userDetailsInit(dynamic response) async {
  final prefs = await SharedPreferences.getInstance();
  log(response.toString());
  prefs.setString('business_name', response[0]['name']);
  User.businessName = response[0]['name'];
  prefs.setString('name', response[0]['owner_name']);
  User.name = response[0]['owner_name'];
}

Future<void> clearData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
