import 'package:data_bar_v2/shared/colors.dart';
import 'package:data_bar_v2/shared/images.dart';
import 'package:data_bar_v2/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogHelper {
  static Widget alert(BuildContext context) {
    return AlertDialog(
      backgroundColor: beigeColor,
      contentPadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      title: Text(
        "Cama café",
        style: GoogleFonts.notoSerif(textStyle: titleText),
      ),
      content: Container(
        height: 100,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(comaLogo),
            SizedBox(width: 20),
            Text(
              "(03) 571 1500\n7:30AM–8PM",
              style: GoogleFonts.notoSerif(textStyle: itemTitleText),
            ),
          ],
        ),
      ),
      actions: [
        MaterialButton(
          elevation: 0.0,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Text(
            'ok',
            style: GoogleFonts.notoSerif(textStyle: itemTitleText),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
