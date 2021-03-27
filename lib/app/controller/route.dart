import 'package:data_bar_v2/app/models/screen_arguments.dart';
import 'package:data_bar_v2/views/aggregate_orders/aggregate_orders_view.dart';
import 'package:data_bar_v2/views/menus/menus_view.dart';
import 'package:data_bar_v2/views/week_orders/week_orders_view.dart';
import 'package:data_bar_v2/views/widget/transition_helper.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static PageRouteBuilder<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/menus':
        final ScreenArguments _args = args;
        return FadeRoute(
          page: MenusView(selectedIndex: _args.selectedIndex),
        );
      case '/aggregateorders':
        final ScreenArguments _args = args;
        return FadeRoute(
          page: AggregateOrdersView(
            selectedIndex: _args.selectedIndex,
          ),
        );
      case '/weekorders':
        final ScreenArguments _args = args;
        return FadeRoute(
          page: WeekOrdersView(selectedIndex: _args.selectedIndex),
        );
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
