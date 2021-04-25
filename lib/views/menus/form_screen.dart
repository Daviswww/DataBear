import 'package:data_bar_v2/app/models/v2_order.dart';
import 'package:data_bar_v2/app/models/v2_menu.dart';
import 'package:data_bar_v2/app/services/api_manager.dart';
import 'package:data_bar_v2/shared/colors.dart';
import 'package:data_bar_v2/shared/icons.dart';
import 'package:data_bar_v2/shared/text_styles.dart';
import 'package:data_bar_v2/shared/value.dart';
import 'package:data_bar_v2/views/widget/form_helper.dart';
import 'package:data_bar_v2/views/widget/snack_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FormView extends StatefulWidget {
  final Item item;
  final int menuIndex;
  FormView({
    Key key,
    @required this.item,
    @required this.menuIndex,
  }) : super(key: key);

  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  Item _item;
  int _menuIndex;
  int selectedIndex = 1;
  bool isShow = true;
  Order order;

  static List<String> iceIcons = [burn, ice0, ice2, ice3];
  static List<String> sugarIcons = [sugar0, sugar1, sugar2, sugar3];

  @override
  void initState() {
    _item = widget.item;
    _menuIndex = widget.menuIndex;
    order = Order(
      orderBy: orderBy,
      itemId: _item.itemId,
      iceId: 4,
      sugarId: 4,
      size: "medium",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beigeColor,
      appBar: _appBar(context),
      body: SingleChildScrollView(
        reverse: true,
        physics: NeverScrollableScrollPhysics(),
        child: IntrinsicHeight(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 100,
            child: Column(
              children: <Widget>[
                FormHelper.priductUI(context, _menuIndex),
                FormHelper.priceUI(_item, order.size),
                _divider(),
                FormHelper.sizeButtonUI(
                  order.size,
                  () {
                    setState(() {
                      order.size = "medium";
                    });
                  },
                  () {
                    setState(() {
                      order.size = "large";
                    });
                  },
                ),
                _divider(),
                iceButtons(_item),
                _divider(),
                sugarButtons(_item),
                _divider(),
                Spacer(),
                FormHelper.submitButtonUI(
                  () {
                    Navigator.pop(context);
                    ApiManager().postOrder(order).then(
                          (value) => {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBarHelper.order(value.statusCode),
                            )
                          },
                        );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding iceButtons(Item item) {
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
          for (var i = 0; i < 4; i++)
            Opacity(
              opacity: item.ices[i].enable ? 1 : 0,
              child: IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: SvgPicture.asset(
                  iceIcons[i],
                  width: 30,
                  color: order.iceId == i + 1 ? brownDarkColor : pinkColor,
                ),
                onPressed: item.ices[i].enable
                    ? () {
                        setState(() {
                          order.iceId = i + 1;
                        });
                      }
                    : null,
              ),
            ),
        ],
      ),
    );
  }

  Padding sugarButtons(Item item) {
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
          for (var i = 0; i < 4; i++)
            Opacity(
              opacity: item.sugars[i].enable ? 1 : 0,
              child: IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: SvgPicture.asset(
                  sugarIcons[i],
                  width: i == 1 ? 20 : 30,
                  color: order.sugarId == i + 1 ? brownDarkColor : pinkColor,
                ),
                onPressed: item.sugars[i].enable
                    ? () {
                        setState(() {
                          order.sugarId = i + 1;
                        });
                      }
                    : null,
              ),
            ),
        ],
      ),
    );
  }

  Divider _divider() {
    return Divider(
      height: 0,
      thickness: 2,
      color: pinkDarkColor,
      indent: 20,
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: true,
      backgroundColor: beigeColor,
      leading: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: brownDarkColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        "Product",
        style: appBarTitleText,
      ),
    );
  }
}
