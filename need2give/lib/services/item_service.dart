// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:need2give/constants/error_handling.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/constants/utils.dart';
import 'package:need2give/models/item.dart';
import 'package:http/http.dart' as http;
import 'package:need2give/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class ItemService {
  static final ItemService _instance = ItemService._init();

  factory ItemService() {
    return _instance;
  }

  ItemService._init();

  Future<List<Item>> get(BuildContext ctx, Map<String, dynamic> params) async {
    List<Item> items = [];
    try {
      http.Response res = await http.get(
        Uri.parse("${Global.url}/items${_parseParams(params)}"),
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
          items = List<Item>.from(
              jsonDecode(res.body)["items"].map((x) => Item.fromMap(x)));
        },
      );
    } catch (e) {
      showSnackBar(ctx, e.toString());
    }
    return items;
  }

  String _parseParams(Map<String, dynamic> params) {
    final queryParams =
        params.entries.map((entry) => "${entry.key}=${entry.value}").join("&");
    return "?$queryParams";
  }
}
