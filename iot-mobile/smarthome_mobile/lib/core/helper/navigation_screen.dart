import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nav {
  static void to(String path, {dynamic? arguments}) {
    Get.toNamed(path, arguments: arguments);
  }

  static void back({dynamic? result}) {
    Get.back(result: result);
  }

  static Future<T?> pushTo<T extends Object?>(
      BuildContext context, Widget screen) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
}
