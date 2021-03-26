import 'package:data_bar_v2/app/models/v2_menu.dart';
import 'package:data_bar_v2/app/services/api_manager.dart';
import 'package:data_bar_v2/shared/colors.dart';
import 'package:data_bar_v2/shared/icons.dart';
import 'package:data_bar_v2/shared/text_styles.dart';
import 'package:data_bar_v2/views/menus/form_screen.dart';
import 'package:data_bar_v2/views/widget/bottom_navigattion_bar_helper.dart';
import 'package:data_bar_v2/views/widget/button_helper.dart';
import 'package:data_bar_v2/views/widget/loadding_helper.dart';
import 'package:data_bar_v2/views/widget/transition_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MenusView extends StatefulWidget {
  final int selectedIndex;

  MenusView({
    Key key,
    @required this.selectedIndex,
  }) : super(key: key);

  @override
  _MenusViewState createState() => _MenusViewState();
}

class _MenusViewState extends State<MenusView> {
  int selectedIndex = 1;
  int menuIndex = 0;
  Future<Menus> _menus;

  @override
  void initState() {
    _menus = ApiManager().getMenus();
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Menus>(
      future: _menus,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildMainMenu(snapshot);
        } else {
          return ProgressHelper.lodding();
        }
      },
    );
  }

  Scaffold buildMainMenu(AsyncSnapshot<Menus> snapshot) {
    return Scaffold(
      backgroundColor: beigeColor,
      appBar: _appBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            _menuList(snapshot),
            Column(
              children: [
                Spacer(),
                NavigationBarHelper.items(context, selectedIndex),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _menuList(AsyncSnapshot<Menus> snapshot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            snapshot.data.payload.menu[menuIndex].series,
            style: GoogleFonts.notoSerif(
              textStyle: titleText,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.payload.menu[menuIndex].items.length,
            itemBuilder: (context, index) {
              var _item = snapshot.data.payload.menu[menuIndex].items[index];
              return ButtonHelper.item(
                context,
                menuIndex,
                _item,
                () {
                  Navigator.push(
                    context,
                    SlideRightRoute(
                      page: FormView(
                        item: _item,
                        menuIndex: menuIndex,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: beigeColor,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0),
          child: Text(
            "Menu",
            style: GoogleFonts.notoSerif(textStyle: appBarTitleText),
          ),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 3.0,
              color: menuIndex == 0 ? Colors.white : Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: SvgPicture.asset(
              coffeeIcon,
              color: brownDarkColor,
            ),
            onPressed: () {
              setState(() {
                menuIndex = 0;
              });
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 3.0,
              color: menuIndex == 1 ? Colors.white : Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: SvgPicture.asset(
              teaIcon,
              color: brownDarkColor,
            ),
            onPressed: () {
              setState(() {
                menuIndex = 1;
              });
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 3.0,
              color: menuIndex == 2 ? Colors.white : Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: SvgPicture.asset(
              drinkIcon,
              color: brownDarkColor,
            ),
            onPressed: () {
              setState(() {
                menuIndex = 2;
              });
            },
          ),
        ),
        SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
