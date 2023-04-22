// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:need2give/constants/error_handling.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/constants/utils.dart';
import 'package:need2give/models/donation_center.dart';
import 'package:http/http.dart' as http;
import 'package:need2give/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class DonationCenterService {
  static final DonationCenterService _instance = DonationCenterService._init();

  factory DonationCenterService() {
    return _instance;
  }

  DonationCenterService._init();

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
}
