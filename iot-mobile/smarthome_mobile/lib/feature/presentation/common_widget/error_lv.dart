import 'package:flutter/material.dart';
import 'package:smarthome_mobile/core/constant/error_const.dart';
import 'package:smarthome_mobile/core/error/custom_error.dart';

class NavSnackBar {
  static void displayError(BuildContext context,
      {required CustomError customError}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        customError.name ?? ErrorConst.unspecifiedError,
      ),
      duration: const Duration(milliseconds: 1000),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ));
  }
}
