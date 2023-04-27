// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:need2give/constants/error_handling.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/constants/utils.dart';
import 'package:need2give/models/donation_center.dart';
import 'package:http/http.dart' as http;
import 'package:need2give/models/user.dart';
import 'package:need2give/provider/auth_provider.dart';
import 'package:need2give/services/auth_service.dart';
import 'package:provider/provider.dart';

class AccountService {
  static final AccountService _instance = AccountService._init();

  factory AccountService() {
    return _instance;
  }

  AccountService._init();

  Future<List<DonationCenter>> get(
      BuildContext ctx, Map<String, dynamic> params) async {
    List<DonationCenter> donationCenters = [];
    try {
      http.Response res = await http.get(
        Uri.parse("${Global.url}/donation_centers/${parseParams(params)}"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization":
              Provider.of<AuthProvider>(ctx, listen: false).profile.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: ctx,
        onSuccess: () {
          donationCenters = List<DonationCenter>.from(
              jsonDecode(res.body)["donation_centers"]
                  .map((x) => DonationCenter.fromMap(x)));
        },
      );
    } catch (e) {
      showSnackBar(ctx, e.toString());
    }
    return donationCenters;
  }

  Future<DonationCenter> getById(BuildContext ctx, int id) async {
    DonationCenter donationCenter = DonationCenter.fromMap({});
    try {
      http.Response res = await http.get(
        Uri.parse("${Global.url}/donation_centers/$id"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization":
              Provider.of<AuthProvider>(ctx, listen: false).profile.token,
        },
      );
      httpErrorHandle(
        response: res,
        context: ctx,
        onSuccess: () {
          donationCenter =
              DonationCenter.fromMap(jsonDecode(res.body)["donation_center"]);
        },
      );
    } catch (e) {
      showSnackBar(ctx, e.toString());
    }
    return donationCenter;
  }

  Future<void> edit(BuildContext ctx, DonationCenterDTO donationCenter) async {
    try {
      http.Response res = await http.patch(
        Uri.parse("${Global.url}/donation_centers/"),
        body: jsonEncode(donationCenter.toMap()["profile"]),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization":
              Provider.of<AuthProvider>(ctx, listen: false).profile.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: ctx,
        onSuccess: () {
          DonationCenter oldProfile =
              Provider.of<AuthProvider>(ctx, listen: false).profile
                  as DonationCenter;
          DonationCenter newProfile = DonationCenter.fromMap({
            ...jsonDecode(res.body)["profile"],
            ...oldProfile.toMap(expanded: false)["account"]
          });

          Provider.of<AuthProvider>(ctx, listen: false).setAccount(
            jsonEncode(newProfile.toMap()),
            AccountType.donationCenter,
          );

          showSnackBar(ctx, "Profile edited successfully");
        },
      );
    } catch (e) {
      showSnackBar(ctx, e.toString());
    }
  }

  Future<void> editUser(BuildContext ctx, UserDTO user) async {
    try {
      http.Response res = await http.patch(
        Uri.parse("${Global.url}/users/"),
        body: jsonEncode(user.toMap()["profile"]),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization":
              Provider.of<AuthProvider>(ctx, listen: false).profile.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: ctx,
        onSuccess: () {
          User oldProfile =
              Provider.of<AuthProvider>(ctx, listen: false).profile as User;
          User newProfile = User.fromMap({
            ...jsonDecode(res.body)["profile"],
            ...oldProfile.toMap(expanded: false)["account"]
          });

          Provider.of<AuthProvider>(ctx, listen: false).setAccount(
            jsonEncode(newProfile.toMap()),
            AccountType.user,
          );

          showSnackBar(ctx, "Profile edited successfully");
        },
      );
    } catch (e) {
      showSnackBar(ctx, e.toString());
    }
  }

  Future<bool> follow(BuildContext ctx, int id) async {
    bool success = false;
    try {
      http.Response res = await http.post(
        Uri.parse("${Global.url}/follow/$id"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization":
              Provider.of<AuthProvider>(ctx, listen: false).profile.token,
        },
      );
      httpErrorHandle(
        response: res,
        context: ctx,
        onSuccess: () {
          success = true;
        },
      );
    } catch (e) {
      showSnackBar(ctx, e.toString());
      Global.logger.i(e.toString());
    }
    return success;
  }

  Future<bool> unfollow(BuildContext ctx, int id) async {
    bool success = false;
    try {
      http.Response res = await http.delete(
        Uri.parse("${Global.url}/follow/$id"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization":
              Provider.of<AuthProvider>(ctx, listen: false).profile.token,
        },
      );
      httpErrorHandle(
        response: res,
        context: ctx,
        onSuccess: () {
          success = true;
        },
      );
    } catch (e) {
      showSnackBar(ctx, e.toString());
      Global.logger.i(e.toString());
    }
    return success;
  }
}
