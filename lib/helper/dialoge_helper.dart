import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  //show error  dialoge
  static void showErrorDialog(
      {String title = 'Error', String description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title ?? '',
                style: Get.textTheme.headline4,
              ),
              Text(
                description ?? '',
                style: Get.textTheme.headline6,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: Text("Okay"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Show SnackBar
  //Show toast
  //Show loading

  static void showLoading([String? message]) {
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 10,
            ),
            Text(message ?? "Loading....."),
          ],
        ),
      ),
    ));
  }

  //Hide Loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
