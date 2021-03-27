import 'package:data_bar_v2/app/models/v2_menu.dart';
import 'package:data_bar_v2/shared/colors.dart';
import 'package:data_bar_v2/shared/icons.dart';
import 'package:data_bar_v2/shared/images.dart';
import 'package:data_bar_v2/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FormHelper {
  static List<String> imageType = [coffeeIcon, teaIcon, drinkIcon];

  static Widget priductUI(BuildContext context, int menuIndex) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      alignment: Alignment.center,
      color: brownLightColor,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: brownDarkColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SvgPicture.asset(
                imageType[menuIndex],
                height: 80,
                color: beigeColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget priceUI(Item _item, String sizeIndex) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Column(
            children: [
              Text(
                "${_item.item}",
                style: appBarTitleText,
              ),
              Text(
                "${sizeIndex == "medium" ? _item.mediumPrice : _item.largePrice} TW",
                style: GoogleFonts.notoSerif(
                  textStyle: itemSubTitleText,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            "1 杯",
            style: GoogleFonts.notoSerif(
              textStyle: itemSubTitleText,
            ),
          ),
        ],
      ),
    );
  }

  static Widget iceButtonUI(
    int iceIndex,
    Function onIce0,
    Function onIce1,
    Function onIce2,
    Function onIce3,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Text(
            "Ice",
            style: GoogleFonts.notoSerif(
              textStyle: itemIceTitleText,
            ),
          ),
          Spacer(),
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: SvgPicture.asset(
              burn,
              width: 30,
              color: iceIndex == 1 ? brownDarkColor : pinkColor,
            ),
            onPressed: () {
              return onIce0();
            },
          ),
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: SvgPicture.asset(
              ice0,
              width: 30,
              color: iceIndex == 2 ? brownDarkColor : pinkColor,
            ),
            onPressed: () {
              return onIce1();
            },
          ),
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: SvgPicture.asset(
              ice2,
              width: 30,
              color: iceIndex == 3 ? brownDarkColor : pinkColor,
            ),
            onPressed: () {
              return onIce2();
            },
          ),
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: SvgPicture.asset(
              ice3,
              width: 30,
              color: iceIndex == 4 ? brownDarkColor : pinkColor,
            ),
            onPressed: () {
              return onIce3();
            },
          ),
        ],
      ),
    );
  }

  static Widget sizeButtonUI(
    String selectIndex,
    Function onMedium,
    Function onLarge,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Text(
            "Size",
            style: GoogleFonts.notoSerif(
              textStyle: itemIceTitleText,
            ),
          ),
          Spacer(),
          SizedBox(
            width: 60,
            child: MaterialButton(
              shape: CircleBorder(),
              padding: EdgeInsets.all(0),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Text(
                "M",
                style: GoogleFonts.notoSerif(
                    textStyle: cupSizeText,
                    color: selectIndex == "medium" ? null : pinkColor),
              ),
              onPressed: () {
                return onMedium();
              },
            ),
          ),
          SizedBox(
            width: 60,
            child: MaterialButton(
              padding: EdgeInsets.all(0),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Text(
                "L",
                style: GoogleFonts.notoSerif(
                  textStyle: cupSizeText,
                  color: selectIndex == "large" ? null : pinkColor,
                ),
              ),
              onPressed: () {
                return onLarge();
              },
            ),
          ),
        ],
      ),
    );
  }

  static Widget sugarButtonUI(
    int sugarIndex,
    Function onSugar0,
    Function onSugar1,
    Function onSugar2,
    Function onSugar3,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Text(
            "Sugar",
            style: GoogleFonts.notoSerif(
              textStyle: itemIceTitleText,
            ),
          ),
          Spacer(),
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: SvgPicture.asset(
              sugar0,
              width: 30,
              color: sugarIndex == 1 ? brownDarkColor : pinkColor,
            ),
            onPressed: () {
              return onSugar0();
            },
          ),
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: SvgPicture.asset(
              sugar1,
              width: 20,
              color: sugarIndex == 2 ? brownDarkColor : pinkColor,
            ),
            onPressed: () {
              return onSugar1();
            },
          ),
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: SvgPicture.asset(
              sugar2,
              width: 30,
              color: sugarIndex == 3 ? brownDarkColor : pinkColor,
            ),
            onPressed: () {
              return onSugar2();
            },
          ),
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: SvgPicture.asset(
              sugar3,
              width: 30,
              color: sugarIndex == 4 ? brownDarkColor : pinkColor,
            ),
            onPressed: () {
              return onSugar3();
            },
          ),
        ],
      ),
    );
  }

  static Widget submitButtonUI(
    Function onPressed, {
    bool isEnabled = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: MaterialButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        padding: EdgeInsets.all(0),
        disabledColor: Colors.black,
        disabledTextColor: Colors.black,
        child: Container(
          alignment: Alignment.center,
          height: 30,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: brownDarkColor, width: 2),
            color: isEnabled ? Colors.grey : pinkDarkColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            "Submit",
            style: submitButtonText,
          ),
        ),
        onPressed: () {
          return onPressed();
        },
      ),
    );
  }

  static Widget inputFidld(Function onChanged, {Function validator}) {
    return TextFormField(
      onChanged: (String value) {
        return onChanged(value);
      },
      validator: (value) {
        return validator(value);
      },
      textAlign: TextAlign.center,
      cursorColor: Colors.black,
      decoration: new InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: pinkDarkColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: pinkDarkColor,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: pinkDarkColor,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: pinkDarkColor,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: pinkDarkColor,
          ),
        ),
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        hintText: "Name",
      ),
    );
  }
}
