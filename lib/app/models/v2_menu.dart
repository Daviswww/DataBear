import 'dart:convert';

Menus menusFromJson(String str) => Menus.fromJson(json.decode(str));

String menusToJson(Menus data) => json.encode(data.toJson());

class Menus {
  Menus({
    this.statusMessage,
    this.payload,
  });

  String statusMessage;
  Payload payload;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
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
    this.menuVersion,
    this.menu,
  });

  String menuVersion;
  List<Menu> menu;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        menuVersion: json["menu_version"],
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "menu_version": menuVersion,
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
      };
}

class Menu {
  Menu({
    this.series,
    this.items,
  });

  String series;
  List<Item> items;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        series: json["series"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "series": series,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.itemId,
    this.item,
    this.mediumPrice,
    this.largePrice,
    this.sugars,
    this.ices,
  });

  int itemId;
  String item;
  int mediumPrice;
  int largePrice;
  List<Sugar> sugars;
  List<Ice> ices;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemId: json["item_id"],
        item: json["item"],
        mediumPrice: json["medium_price"],
        largePrice: json["large_price"],
        sugars: List<Sugar>.from(json["sugars"].map((x) => Sugar.fromJson(x))),
        ices: List<Ice>.from(json["ices"].map((x) => Ice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "item": item,
        "medium_price": mediumPrice,
        "large_price": largePrice,
        "sugars": List<dynamic>.from(sugars.map((x) => x.toJson())),
        "ices": List<dynamic>.from(ices.map((x) => x.toJson())),
      };
}

class Ice {
  Ice({
    this.iceId,
    this.iceTag,
  });

  int iceId;
  IceTag iceTag;

  factory Ice.fromJson(Map<String, dynamic> json) => Ice(
        iceId: json["ice_id"],
        iceTag: iceTagValues.map[json["ice_tag"]],
      );

  Map<String, dynamic> toJson() => {
        "ice_id": iceId,
        "ice_tag": iceTagValues.reverse[iceTag],
      };
}

enum IceTag { EMPTY, ICE_TAG, PURPLE, FLUFFY }

final iceTagValues = EnumValues({
  "熱": IceTag.EMPTY,
  "正常冰": IceTag.FLUFFY,
  "去冰": IceTag.ICE_TAG,
  "少冰": IceTag.PURPLE
});

class Sugar {
  Sugar({
    this.sugarId,
    this.sugarTag,
  });

  int sugarId;
  SugarTag sugarTag;

  factory Sugar.fromJson(Map<String, dynamic> json) => Sugar(
        sugarId: json["sugar_id"],
        sugarTag: sugarTagValues.map[json["sugar_tag"]],
      );

  Map<String, dynamic> toJson() => {
        "sugar_id": sugarId,
        "sugar_tag": sugarTagValues.reverse[sugarTag],
      };
}

enum SugarTag { EMPTY, SUGAR_TAG, PURPLE, FLUFFY }

final sugarTagValues = EnumValues({
  "無糖": SugarTag.EMPTY,
  "正常糖": SugarTag.FLUFFY,
  "半糖": SugarTag.PURPLE,
  "微糖": SugarTag.SUGAR_TAG
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
