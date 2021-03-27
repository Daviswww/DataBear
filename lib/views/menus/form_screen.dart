import 'package:data_bar_v2/app/models/v2_order.dart';
import 'package:data_bar_v2/app/models/v2_menu.dart';
import 'package:data_bar_v2/app/services/api_manager.dart';
import 'package:data_bar_v2/shared/colors.dart';
import 'package:data_bar_v2/shared/text_styles.dart';
import 'package:data_bar_v2/shared/value.dart';
import 'package:data_bar_v2/views/widget/form_helper.dart';
import 'package:data_bar_v2/views/widget/snack_bar_helper.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    _item = widget.item;
    _menuIndex = widget.menuIndex;
    order = Order(
      orderBy: orderBy,
      itemId: _item.itemId,
      iceId: 1,
      sugarId: 1,
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
                FormHelper.iceButtonUI(
                  order.iceId,
                  () {
                    setState(() {
                      order.iceId = 1;
                    });
                  },
                  () {
                    setState(() {
                      order.iceId = 2;
                    });
                  },
                  () {
                    setState(() {
                      order.iceId = 3;
                    });
                  },
                  () {
                    setState(() {
                      order.iceId = 4;
                    });
                  },
                ),
                _divider(),
                FormHelper.sugarButtonUI(
                  order.sugarId,
                  () {
                    setState(() {
                      order.sugarId = 1;
                    });
                  },
                  () {
                    setState(() {
                      order.sugarId = 2;
                    });
                  },
                  () {
                    setState(() {
                      order.sugarId = 3;
                    });
                  },
                  () {
                    setState(() {
                      order.sugarId = 4;
                    });
                  },
                ),
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
