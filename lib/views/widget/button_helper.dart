import 'package:data_bar_v2/app/models/v2_menu.dart';
import 'package:data_bar_v2/shared/colors.dart';
import 'package:data_bar_v2/shared/icons.dart';
import 'package:data_bar_v2/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonHelper {
  static List<String> imageType = [coffeeIcon, teaIcon, drinkIcon];

  static Widget item(
    BuildContext context,
    int menuIndex,
    Item item,
    Function onPressed,
  ) {
    return Column(
      children: <Widget>[
        MaterialButton(
          elevation: 0.0,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          padding: EdgeInsets.all(0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      imageType[menuIndex],
                      width: 60,
                      color: pinkDarkColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                    child: Text(
                      "${item.item}",
                      style: GoogleFonts.notoSerif(
                        textStyle: itemTitleText,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.chevron_right_rounded,
                      color: pinkDarkColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          onPressed: () {
            return onPressed();
          },
        ),
        Divider(
          indent: 20,
          endIndent: 20,
          color: pinkDarkColor,
        ),
      ],
    );
  }
}
