import 'package:data_bar_v2/shared/colors.dart';
import 'package:data_bar_v2/shared/text_styles.dart';
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
}
