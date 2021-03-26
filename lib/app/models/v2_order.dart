// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.orderBy,
    this.size,
    this.itemId,
    this.sugarId,
    this.iceId,
  });

  String orderBy;
  String size;
  int itemId;
  int sugarId;
  int iceId;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderBy: json["order_by"],
        size: json["size"],
        itemId: json["item_id"],
        sugarId: json["sugar_id"],
        iceId: json["ice_id"],
      );

  Map<String, dynamic> toJson() => {
        "order_by": orderBy,
        "size": size,
        "item_id": itemId,
        "sugar_id": sugarId,
        "ice_id": iceId,
      };
}
