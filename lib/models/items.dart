import 'package:cloud_firestore/cloud_firestore.dart';

class Items {
  String? menuId;
  String? sellersUid;
  String? itemId;
  String? title;
  String? description;
  Timestamp? publishedDate;
  String? thumbnailUrl;
  String? status;
  int? price;

  Items({
    this.menuId,
    this.sellersUid,
    this.itemId,
    this.description,
    this.title,
    this.publishedDate,
    this.thumbnailUrl,
    this.status,
  });

  Items.fromJson(Map<String, dynamic> json) {
    menuId = json["menuId"];
    sellersUid = json["sellersUid"];
    itemId = json["itemId"];
    description = json["description"];
    title = json["title"];
    publishedDate = json["publishedDate"];
    thumbnailUrl = json["thumbnailUrl"];
    status = json["status"];
    price = json["price"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["menuId"] = menuId;
    data["sellersUid"] = sellersUid;
    data["itemId"] = itemId;
    data["description"] = description;
    data["title"] = title;
    data["price"] = price;
    data["publishedDate"] = publishedDate;
    data["thumbnailUrl"] = thumbnailUrl;
    data["status"] = status;

    return data;
  }
}
