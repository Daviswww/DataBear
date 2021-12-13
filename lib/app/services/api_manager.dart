import 'dart:developer';

import 'package:data_bar_v2/app/models/v2_order.dart';
import 'package:data_bar_v2/app/models/v2_menu.dart';
import 'package:data_bar_v2/app/models/v2_aggregate_orders.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  // static String domain = 'http://140.114.85.21:5000';
  // static String domain = 'http://140.114.85.21:5002';
  // static String domain = 'http://localhost:5000';
  // static String domain = 'http://shwu16.cs.nthu.edu.tw:5002';
  static String domain = 'http://3.37.201.24:5002';

  Future<Menus> getMenus() async {
    var menus;
    // final url = Uri(host: domain, port: 5002, path: '/v2/menus/');
    final response = await http.get(domain + '/v2/menus/');
    print(response.statusCode);
    try {
      // If the server did return a 200 OK response,
      if (response.statusCode == 200) {
        menus = menusFromJson(response.body);
      }
    } catch (Exception) {
      log("Failed to load Menus");
      return menus;
    }
    return menus;
  }

  Future<AggregateOrders> getAggregateOrders() async {
    var orders;
    final url = domain + '/v2/orders/';
    final response = await http.get(url);
    print(response.statusCode);
    try {
      // If the server did return a 200 OK response,
      if (response.statusCode == 200) {
        orders = aggregateOrdersFromJson(response.body);
      }
      if (response.statusCode == 202) {
        orders = aggregateOrdersFromJson(response.body);
      }
    } catch (Exception) {
      log("Failed to load Orders");
      return orders;
    }
    return orders;
  }

  Future<http.Response> postOrder(Order order) async {
    final url = domain + '/v2/orders/';
    final body = orderToJson(order);

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: body,
    );

    try {
      if (response.statusCode == 200) {
        return response;
      }
    } catch (Exception) {
      log("Failed to post Order");
    }
    return response;
  }
}
