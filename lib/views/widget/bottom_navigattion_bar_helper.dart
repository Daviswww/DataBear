import 'package:data_bar_v2/app/models/screen_arguments.dart';
import 'package:data_bar_v2/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationBarHelper {
  static Widget items(
    BuildContext context,
    int selectIndex, {
    bool show = true,
  }) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: !show
          ? Container(
              child: Text("Hi"),
            )
          : Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 83,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(width: 1, color: brownDarkColor),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Icon(
                        Icons.shopping_cart,
                        color:
                            0 == selectIndex ? brownDarkColor : brownLightColor,
                        size: 0 == selectIndex ? 30 : 25,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          '/aggregateorders',
                          arguments: ScreenArguments(0),
                        );
                      },
                    ),
                    IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Icon(
                        Icons.menu_rounded,
                        color:
                            1 == selectIndex ? brownDarkColor : brownLightColor,
                        size: 1 == selectIndex ? 30 : 25,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/menus',
                          arguments: ScreenArguments(1),
                        );
                      },
                    ),
                    IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      disabledColor: Colors.white,
                      icon: Icon(
                        Icons.person_sharp,
                        color:
                            2 == selectIndex ? brownDarkColor : brownLightColor,
                        size: 2 == selectIndex ? 30 : 25,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          '/weekorders',
                          arguments: ScreenArguments(2),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
