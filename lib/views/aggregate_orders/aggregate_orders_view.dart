import 'package:data_bar_v2/app/models/v2_aggregate_orders.dart';
import 'package:data_bar_v2/app/services/api_manager.dart';
import 'package:data_bar_v2/shared/colors.dart';
import 'package:data_bar_v2/shared/text_styles.dart';
import 'package:data_bar_v2/views/widget/bottom_navigattion_bar_helper.dart';
import 'package:data_bar_v2/views/widget/loadding_helper.dart';
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
              itemCount: snapshot.data.payload.weekOrders.length,
              itemBuilder: (context, index) {
                var _order = snapshot.data.payload.weekOrders[0];
                return Container();
              },
            ),
            Column(
              children: <Widget>[
                Spacer(),
                Container(
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
                        "\$${snapshot.data.payload.totalPrice}",
                        style: GoogleFonts.notoSerif(
                          textStyle: itemSubTitleText,
                        ),
                      ),
                    ],
                  ),
                ),
                NavigationBarHelper.items(context, selectedIndex),
              ],
            ),
          ],
        ),
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
            icon: Icon(
              Icons.sync_rounded,
              color: brownDarkColor,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
