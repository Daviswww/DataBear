import 'package:data_bar_v2/shared/colors.dart';
import 'package:data_bar_v2/shared/text_styles.dart';
import 'package:data_bar_v2/shared/value.dart';
import 'package:flutter/material.dart';

class SnackBarHelper {
  static Widget aggregateOrders() {
    return SnackBar(
      content: const Text(
        '訂單已更新',
        style: snackBarText,
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      backgroundColor: pinkDarkColor,
    );
  }

  static Widget order(int statusCode) {
    if (statusCode == 200) {
      return SnackBar(
        content: Text(
          '($statusCode) $orderBy 的訂單已送出',
          style: snackBarText,
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        backgroundColor: pinkDarkColor,
      );
    } else {
      return SnackBar(
        content: Text(
          '($statusCode) $orderBy 的訂單飛到黑洞',
          style: snackBarText,
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        backgroundColor: pinkDarkColor,
      );
    }
  }
}
