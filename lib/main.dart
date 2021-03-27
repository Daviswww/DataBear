import 'package:data_bar_v2/app/controller/route.dart';
import 'package:data_bar_v2/views/menus/menus_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MenusView(
        selectedIndex: 1,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
