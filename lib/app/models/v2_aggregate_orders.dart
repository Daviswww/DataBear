// To parse this JSON data, do
//
//     final aggregateOrders = aggregateOrdersFromJson(jsonString);

import 'dart:convert';

AggregateOrders aggregateOrdersFromJson(String str) =>
    AggregateOrders.fromJson(json.decode(str));

String aggregateOrdersToJson(AggregateOrders data) =>
    json.encode(data.toJson());

class AggregateOrders {
  AggregateOrders({
    this.statusMessage,
    this.payload,
  });

  String statusMessage;
  Payload payload;

  factory AggregateOrders.fromJson(Map<String, dynamic> json) =>
      AggregateOrders(
        statusMessage: json["status_message"],
        payload: Payload.fromJson(json["payload"]),
      );

  Map<String, dynamic> toJson() => {
        "status_message": statusMessage,
        "payload": payload.toJson(),
      };
}

class Payload {
  Payload({
    this.meetingTime,
    this.totalPrice,
    this.aggregateOrders,
    this.weekOrders,
  });

  DateTime meetingTime;
  int totalPrice;
  List<AggregateOrder> aggregateOrders;
  List<WeekOrder> weekOrders;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        meetingTime: DateTime.parse(json["meeting_time"]),
        totalPrice: json["total_price"],
        aggregateOrders: List<AggregateOrder>.from(
            json["aggregate_orders"].map((x) => AggregateOrder.fromJson(x))),
        weekOrders: List<WeekOrder>.from(
            json["week_orders"].map((x) => WeekOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meeting_time": meetingTime.toIso8601String(),
        "total_price": totalPrice,
        "aggregate_orders":
            List<dynamic>.from(aggregateOrders.map((x) => x.toJson())),
        "week_orders": List<dynamic>.from(weekOrders.map((x) => x.toJson())),
      };
}

class AggregateOrder {
  AggregateOrder({
    this.item,
    this.size,
    this.sugarTag,
    this.iceTag,
    this.subTotalPrice,
    this.number,
  });

  String item;
  String size;
  String sugarTag;
  String iceTag;
  int subTotalPrice;
  int number;

  factory AggregateOrder.fromJson(Map<String, dynamic> json) => AggregateOrder(
        item: json["item"],
        size: json["size"],
        sugarTag: json["sugar_tag"],
        iceTag: json["ice_tag"],
        subTotalPrice: json["sub_total_price"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "item": item,
        "size": size,
        "sugar_tag": sugarTag,
        "ice_tag": iceTag,
        "sub_total_price": subTotalPrice,
        "number": number,
      };
}

class WeekOrder {
  WeekOrder({
    this.orderBy,
    this.item,
    this.size,
    this.price,
    this.sugarTag,
    this.iceTag,
    this.orderTime,
  });

  String orderBy;
  String item;
  String size;
  int price;
  String sugarTag;
  String iceTag;
  DateTime orderTime;

  factory WeekOrder.fromJson(Map<String, dynamic> json) => WeekOrder(
        orderBy: json["order_by"],
        item: json["item"],
        size: json["size"],
        price: json["price"],
        sugarTag: json["sugar_tag"],
        iceTag: json["ice_tag"],
        orderTime: DateTime.parse(json["order_time"]).toLocal(),
      );

  Map<String, dynamic> toJson() => {
        "order_by": orderBy,
        "item": item,
        "size": size,
        "price": price,
        "sugar_tag": sugarTag,
        "ice_tag": iceTag,
        "order_time": orderTime.toString(),
      };
}
