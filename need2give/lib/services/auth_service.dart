// ignore_for_file: use_build_context_synchronously
// TODO: check if context is mounted

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:need2give/constants/error_handling.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/constants/utils.dart';
import 'package:http/http.dart' as http;
import 'package:need2give/models/user.dart';
import 'package:need2give/provider/user_provider.dart';
import 'package:need2give/screens/user/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static final AuthService _instance = AuthService._init();

  factory AuthService() {
    return _instance;
  }

  AuthService._init();

  void _onSuccess(BuildContext context, http.Response res) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final resBody = jsonDecode(res.body);
    Provider.of<UserProvider>(context, listen: false).setUser(
        jsonEncode({...resBody["profile"], "token": resBody["token"]}));
    await prefs.setString("token", resBody["token"]);
    Navigator.pushNamedAndRemoveUntil(
      context,
      Home.routeName,
      (route) => false,
    );
  }

  void signUp({
    required BuildContext context,
    required String email,
    required String username,
    required String password,
    required String birthDate,
    required String fullName,
    String? phone,
  }) async {
    try {
      UserDTO user = UserDTO(
        username: username,
        email: email,
        password: password,
        phoneNumber: phone,
        birthDate: birthDate,
        fullName: fullName,
      );
      http.Response res = await http.post(
        Uri.parse("${Global.url}/auth/signup?role=user"),
        body: user.toJson(),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          _onSuccess(context, res);
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
          _onSuccess(context, res);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
