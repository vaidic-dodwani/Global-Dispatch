// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:globaldispatch/Config/api_links.dart';
import 'package:globaldispatch/static_classes.dart';
import 'package:http/http.dart';

class ApiCalls {
  static Future<dynamic> signIn(
      {required String email, required String password}) async {
    try {
      log("Began Login Process For $email $password");
      final response = await post(
        Uri.parse(Links.prefixLink + Links.signInLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{"email": email.toLowerCase(), "password": password},
        ),
      );
      log(response.statusCode.toString());

      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;
      log(output.toString());

      return output;
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<dynamic> signUp(
      {required String email, required String password}) async {
    try {
      log("Began Sign Up Process For $email $password");
      final response = await post(
        Uri.parse(Links.prefixLink + Links.signUpLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{"email": email.toLowerCase(), "password": password},
        ),
      );
      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;
      log(output.toString());
      return output;
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<dynamic> sendEmailOTP({required String email}) async {
    try {
      log("Began Otp Send Process For $email ");
      final response = await post(
        Uri.parse(Links.prefixLink + Links.sendEmailOtpLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{"email": email},
        ),
      );
      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;

      log(output.toString());
      return output;
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<dynamic> verifyEmailOTP(
      {required String email, required int otp}) async {
    try {
      log("Began Otp Verification Process For $email with pin $otp");
      final response = await post(
        Uri.parse(Links.prefixLink + Links.verifyEmailOtpLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{"email": email, 'otp': otp},
        ),
      );
      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;

      log(output.toString());
      return output;
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<dynamic> addBusinessDetails(
      {required String owner_name, required String business_name}) async {
    try {
      log("Began Business Addition Verification Process For $owner_name with pin $business_name");
      final response = await post(
        Uri.parse(Links.prefixLink + Links.addBusinessDetails),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${App.acesss}'
        },
        body: jsonEncode(
          <String, dynamic>{"name": business_name, 'owner_name': owner_name},
        ),
      );
      final output = jsonDecode(response.body);
      output['statusCode'] = response.statusCode;

      log(output.toString());
      return output;
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<dynamic> getUserDetails() async {
    try {
      Response response = await get(
        Uri.parse(Links.prefixLink + Links.addBusinessDetails),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${App.acesss}'
        },
      );
      final output = jsonDecode(response.body);
      return output;
    } catch (e) {
      log("$e");
    }
  }
}
