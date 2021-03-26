import 'package:flutter/material.dart';

class ProgressHelper {
  static Widget lodding() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircularProgressIndicator(
            strokeWidth: 10,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
