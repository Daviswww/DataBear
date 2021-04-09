import 'package:data_bar_v2/app/models/v2_aggregate_orders.dart';
import 'package:data_bar_v2/app/services/api_manager.dart';
import 'package:data_bar_v2/shared/colors.dart';
import 'package:data_bar_v2/shared/text_styles.dart';
import 'package:data_bar_v2/views/widget/bottom_navigattion_bar_helper.dart';
import 'package:data_bar_v2/views/widget/progress_helper.dart';
import 'package:data_bar_v2/views/widget/snack_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeekOrdersView extends StatefulWidget {
  final int selectedIndex;

  WeekOrdersView({
    Key key,
    @required this.selectedIndex,
  }) : super(key: key);

  @override
  _WeekOrdersViewState createState() => _WeekOrdersViewState();
}

class _WeekOrdersViewState extends State<WeekOrdersView> {
  int selectedIndex = 1;
  Future<AggregateOrders> _aggregateOrders;
  static List<String> weekDay = [
    "MON",
    "TUE",
    "WED",
    "THU",
    "FRI",
    "SAT",
    "SUN"
  ];
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
              itemCount: snapshot.data.payload.weekOrders.length,
              itemBuilder: (context, index) {
                var _order = snapshot.data.payload.weekOrders[index];
                if (index != snapshot.data.payload.weekOrders.length - 1) {
                  return _orderBlock(_order);
                } else {
                  return Column(
                    children: [
                      _orderBlock(_order),
                      SizedBox(height: 150),
                    ],
                  );
                }
              },
            ),
            Column(
              children: <Widget>[
                Spacer(),
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

  Container _orderBlock(WeekOrder _order) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _orderDate(_order),
          _orderInfo(_order),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(2, 2),
          ),
        ],
      ),
    );
  }

  Expanded _orderInfo(WeekOrder _order) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                Text(
                  "${_order.orderBy}",
                  style: ordersText,
                ),
                Spacer(),
                Text(
                  "\$${_order.price}",
                  textAlign: TextAlign.center,
                  style: weekOrderPriceText,
                ),
              ],
            ),
            Text(
              "${_order.item}",
              style: orderText,
            ),
            Row(
              children: [
                Text(
                  "${_order.size == "medium" ? "中杯" : "大杯"}",
                  style: orderText,
                ),
                Text(
                  " / ${_order.iceTag}",
                  style: orderText,
                ),
                Text(
                  " / ${_order.sugarTag}",
                  style: orderText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _orderDate(WeekOrder _order) {
    return Container(
      width: 70,
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "${weekDay[_order.orderTime.weekday - 1]}",
            style: GoogleFonts.notoSerif(
              textStyle: dateText,
            ),
          ),
          Text(
            "${_order.orderTime.day}",
            style: GoogleFonts.notoSerif(
              textStyle: dayText,
            ),
          ),
          Text(
            "${_order.orderTime.hour} : ${_order.orderTime.minute}",
            style: GoogleFonts.notoSerif(
              textStyle: dateText,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        // color: pinkColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(width: 2, color: brownLightColor),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: beigeColor,
      automaticallyImplyLeading: false,
      title: Text(
        "Detail",
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
