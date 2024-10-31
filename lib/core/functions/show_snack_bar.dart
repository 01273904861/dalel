import 'package:dalel/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
     
    msg:  msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 17.sp,
  );
}
