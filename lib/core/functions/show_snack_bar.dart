import 'package:dalel/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(
          message,
          textAlign: TextAlign.center,
        )),
  );
}

void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.primaryColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
