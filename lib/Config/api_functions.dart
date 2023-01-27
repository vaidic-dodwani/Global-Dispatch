import 'package:globaldispatch/Config/api_integration.dart';
import 'package:globaldispatch/static_classes.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String noInternet = "App_Error:No_Internet";

Future initAuth() async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('access')) {
    String access = prefs.getString('access')!;
    User.access = access;
    final output = await ApiCalls.getUserDetails();
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
}

Future<void> clearData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
