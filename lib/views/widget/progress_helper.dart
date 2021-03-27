import 'package:data_bar_v2/shared/colors.dart';
import 'package:data_bar_v2/shared/images.dart';
import 'package:data_bar_v2/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressHelper {
  static Widget lodding() {
    return Scaffold(
      backgroundColor: beigeColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(coffee),
            Container(
              width: 120,
              height: 2,
              color: brownDarkColor,
            ),
            Text(
              "DataLab",
              style: GoogleFonts.notoSerif(
                textStyle: titleText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
