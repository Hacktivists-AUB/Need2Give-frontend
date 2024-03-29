import 'dart:convert';

import 'package:need2give/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)["message"]);
      break;
    case 404:
      showSnackBar(context, jsonDecode(response.body)["message"]);
      break;
    case 406:
      showSnackBar(context, jsonDecode(response.body)["message"]);
      break;
    case 409:
      showSnackBar(context, jsonDecode(response.body)["message"]);
      break;
    case 500:
      showSnackBar(context, "Oops! Something went wrong.");
      break;
    default:
      showSnackBar(context, "Oops! Something went wrong.");
      break;
  }
}
