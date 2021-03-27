import 'package:data_bar_v2/app/models/v2_aggregate_orders.dart';
import 'package:data_bar_v2/app/services/api_manager.dart';
import 'package:data_bar_v2/shared/colors.dart';
import 'package:data_bar_v2/shared/text_styles.dart';
import 'package:data_bar_v2/views/widget/bottom_navigattion_bar_helper.dart';
import 'package:data_bar_v2/views/widget/loadding_helper.dart';
import 'package:data_bar_v2/views/widget/snack_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AggregateOrdersView extends StatefulWidget {
  final int selectedIndex;

  AggregateOrdersView({
    Key key,
    @required this.selectedIndex,
  }) : super(key: key);

  @override
  _AggregateOrdersViewState createState() => _AggregateOrdersViewState();
}

class _AggregateOrdersViewState extends State<AggregateOrdersView> {
  int selectedIndex = 1;
  Future<AggregateOrders> _aggregateOrders;
  var a;
  @override
  void initState() {
    _aggregateOrders = ApiManager().getAggregateOrders();
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AggregateOrders>(
      future: _aggregateOrders,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildMainAggregateOrders(snapshot);
        } else {
          return ProgressHelper.lodding();
        }
      },
    );
  }

  Scaffold buildMainAggregateOrders(AsyncSnapshot<AggregateOrders> snapshot) {
    return Scaffold(
      backgroundColor: beigeColor,
      appBar: _appbar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.payload.aggregateOrders.length,
              itemBuilder: (context, index) {
                var _order = snapshot.data.payload.aggregateOrders[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _orderTitle(index, _order),
                    _orderInfo(_order),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                );
              },
            ),
            Column(
              children: <Widget>[
                Spacer(),
                _totalAmount(snapshot),
                NavigationBarHelper.items(
                  context,
                  selectedIndex,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding _orderInfo(AggregateOrder _order) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
      child: Row(
        children: [
          Text(
            "${_order.size == "medium" ? "中杯" : "大杯"}",
            style: ordersText,
          ),
          Text(
            " / ${_order.iceTag}",
            style: ordersText,
          ),
          Text(
            " / ${_order.sugarTag}",
            style: ordersText,
          ),
          Spacer(),
          Text(
            "\$ ${_order.subTotalPrice} TW",
            style: GoogleFonts.notoSerif(textStyle: ordersText),
          ),
        ],
      ),
    );
  }

  Padding _orderTitle(int index, AggregateOrder _order) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text(
            "${index + 1}. ${_order.item}",
            style: itemSubTitleText,
          ),
          Spacer(),
          SizedBox(
            width: 40,
            height: 30,
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.remove_circle_outline_rounded),
              onPressed: () {},
            ),
          ),
          Text(
            "${_order.number}",
            style: GoogleFonts.notoSerif(
              textStyle: itemTitleText,
            ),
          ),
          SizedBox(
            width: 40,
            height: 30,
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.add_circle_outline_rounded),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Container _totalAmount(AsyncSnapshot<AggregateOrders> snapshot) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      height: 50,
      color: Colors.white,
      child: Row(
        children: [
          Text(
            "Total Amount",
            style: GoogleFonts.notoSerif(
              textStyle: itemSubTitleText,
            ),
          ),
          Spacer(),
          Text(
            "\$ ${snapshot.data.payload.totalPrice} / ${snapshot.data.payload.weekOrders.length} 杯",
            style: GoogleFonts.notoSerif(
              textStyle: itemSubTitleText,
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: beigeColor,
      automaticallyImplyLeading: false,
      title: Text(
        "Orders",
        style: GoogleFonts.notoSerif(
          textStyle: titleText,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.sync_rounded,
              color: brownDarkColor,
            ),
            onPressed: () {
              setState(() {
                _aggregateOrders = ApiManager().getAggregateOrders();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBarHelper.aggregateOrders(),
                );
              });
            },
          ),
        ),
      ],
    );
  }
}
