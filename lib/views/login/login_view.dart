import 'package:data_bar_v2/app/models/screen_arguments.dart';
import 'package:data_bar_v2/shared/colors.dart';
import 'package:data_bar_v2/shared/images.dart';
import 'package:data_bar_v2/shared/value.dart';
import 'package:data_bar_v2/views/widget/form_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beigeColor,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  wineGlasses,
                  color: brownLightColor,
                  width: 150,
                  height: 150,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: FormHelper.inputFidld(
                        (onChangedValue) {
                          setState(() {
                            orderBy = onChangedValue;
                          });
                          print(onChangedValue);
                        },
                      ),
                    ),
                    FormHelper.submitButtonUI(
                      () {
                        if (orderBy.length != 0) {
                          Navigator.pushReplacementNamed(
                            context,
                            '/menus',
                            arguments: ScreenArguments(1),
                          );
                        }
                      },
                      isEnabled: orderBy.length == 0,
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
