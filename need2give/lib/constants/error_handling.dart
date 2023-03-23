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
      showSnackBar(context, response.body);
      break;
    case 500:
      showSnackBar(context, response.body);
      break;
    default:
      showSnackBar(context, response.body);
      break;
  }
}
