import 'package:data_bar_v2/shared/colors.dart';
import 'package:data_bar_v2/views/widget/bottom_navigattion_bar_helper.dart';
import 'package:flutter/material.dart';

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
  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beigeColor,
      body: Stack(
        children: [
          NavigationBarHelper.items(context, selectedIndex),
        ],
      ),
    );
  }
}
