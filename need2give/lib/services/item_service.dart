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
        Uri.parse("${Global.url}/items${parseParams(params)}"),
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

  Future<void> add(BuildContext ctx, ItemDTO item) async {
    try {
      http.Response res = await http.post(
        Uri.parse("${Global.url}/items/"),
        body: item.toJson(),
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
          showSnackBar(ctx, "Item added successfully");
        },
      );
    } catch (e) {
      showSnackBar(ctx, e.toString());
    }
  }

  Future<void> edit(BuildContext ctx, ItemDTO item, int id) async {
    try {
      http.Response res = await http.patch(
        Uri.parse("${Global.url}/items/$id"),
        body: item.copyWithoutDonorId().toJson(),
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
          showSnackBar(ctx, "Item edited successfully");
        },
      );
    } catch (e) {
      showSnackBar(ctx, e.toString());
    }
  }

  Future<void> delete(BuildContext ctx, int id) async {
    try {
      http.Response res = await http.delete(
        Uri.parse("${Global.url}/items/$id"),
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
          showSnackBar(ctx, "Item deleted successfully");
        },
      );
    } catch (e) {
      showSnackBar(ctx, e.toString());
    }
  }

  Future<Map<String, int>> getStats(BuildContext ctx) async {
    Map<String, int> res = {};
    try {
      http.Response response = await http.get(
        Uri.parse("${Global.url}/items/stats"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization":
              Provider.of<AuthProvider>(ctx, listen: false).profile.token,
        },
      );

      httpErrorHandle(
        response: response,
        context: ctx,
        onSuccess: () {
          res = json
              .decode(response.body)
              .map((key, value) => MapEntry(key, int.parse(value.toString())))
              .cast<String, int>();
        },
      );
    } catch (e) {
      showSnackBar(ctx, e.toString());
      Global.logger.w(e.toString());
    }
    return res;
  }
}
