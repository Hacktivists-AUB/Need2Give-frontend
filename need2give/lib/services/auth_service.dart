// ignore_for_file: use_build_context_synchronously
// TODO: check if context is mounted

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:need2give/constants/error_handling.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/constants/utils.dart';
import 'package:http/http.dart' as http;
import 'package:need2give/models/account.dart';
import 'package:need2give/provider/auth_provider.dart';
import 'package:need2give/screens/main_pages_navbar/button_navbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AccountType {
  none,
  user,
  donationCenter,
}

class AuthService {
  static final AuthService _instance = AuthService._init();

  factory AuthService() {
    return _instance;
  }

  AuthService._init();

  Future<void> signUp({
    required BuildContext context,
    required Account profile,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse(
            "${Global.url}/auth/signup?role=${(profile.type == AccountType.user ? 'user' : 'donation_center')}"),
        body: profile.toJson(),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          final resBody = jsonDecode(res.body);
          Provider.of<AuthProvider>(context, listen: false).setAccount(
              jsonEncode({...resBody["profile"], "token": resBody["token"]}),
              profile.type);
          await prefs.setString("token", resBody["token"]);
          Navigator.pushNamedAndRemoveUntil(
            context,
            ButtonNavbar.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse("${Global.url}/auth/login"),
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          final resBody = jsonDecode(res.body);

          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("token", resBody["token"]);

          await _setAccountFromToken(context, resBody["token"]);

          Navigator.pushNamedAndRemoveUntil(
            context,
            ButtonNavbar.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      if (token == null) {
        prefs.setString("token", "");
        return;
      }

      await _setAccountFromToken(context, token);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> _setAccountFromToken(BuildContext context, String token) async {
    try {
      http.Response res = await http.get(
        Uri.parse("${Global.url}/auth/test"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": token
        },
      );

      if (res.statusCode == 200) {
        final resBody = jsonDecode(res.body);

        Provider.of<AuthProvider>(context, listen: false).setAccount(
          jsonEncode({...resBody["profile"], "token": token}),
          _inferAccountType({...resBody["profile"]}),
        );
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  AccountType _inferAccountType(Map<String, dynamic> obj) {
    return obj.length > 7 ? AccountType.donationCenter : AccountType.user;
  }
}
