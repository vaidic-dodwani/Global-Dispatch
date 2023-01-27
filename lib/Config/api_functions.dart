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
  } else {
    App.isLoggedIn = false;
  }
}

Future appInstanceInit() async {
  final prefs = await SharedPreferences.getInstance();
}

Future userDetailsInit(Map<dynamic, dynamic> response) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('id', response['id']);
  User.id = response['id'];
  prefs.setString('business_name', response['name']);
  User.businessName = response['name'];
  prefs.setString('name', response['owner_name']);
  User.name = response['owner_name'];
}

Future<void> clearData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
