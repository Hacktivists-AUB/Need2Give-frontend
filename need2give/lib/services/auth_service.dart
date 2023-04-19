// ignore_for_file: use_build_context_synchronously
// TODO: check if context is mounted

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:need2give/constants/error_handling.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/constants/utils.dart';
import 'package:http/http.dart' as http;
import 'package:need2give/models/profile.dart';
import 'package:need2give/provider/auth_provider.dart';
import 'package:need2give/screens/user/home.dart';
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

  void signUp({
    required BuildContext context,
    required Profile profile,
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
            Home.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void login({
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
          SharedPreferences prefs = await SharedPreferences.getInstance();
          final resBody = jsonDecode(res.body);
          Provider.of<AuthProvider>(context, listen: false).setAccount(
              jsonEncode({...resBody["account"], "token": resBody["token"]}),
              AccountType.none);
          await prefs.setString("token", resBody["token"]);
          Navigator.pushNamedAndRemoveUntil(
            context,
            Home.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
