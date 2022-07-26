import 'package:cloud_firestore/cloud_firestore.dart';

class Menus {
  String? menuId;
  String? sellersUid;
  String? menuTitle;
  String? menuInfo;
  Timestamp? publishedDate;
  String? thumbnailUrl;
  String? status;

  Menus({
    this.menuId,
    this.sellersUid,
    this.menuInfo,
    this.menuTitle,
    this.publishedDate,
    this.thumbnailUrl,
    this.status,
  });

  Menus.fromJson(Map<String,dynamic>json){
    menuId = json["menuId"];
    sellersUid = json["sellersUid"];
    menuInfo = json["menuInfo"];
    menuTitle = json["menuTitle"];
    publishedDate = json["publishedDate"];
    thumbnailUrl = json["thumbnailUrl"];
    status = json["status"];

  }

  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};

    data["menuId"] = menuId;
    data["sellersUid"] = sellersUid;
    data["menuInfo"] = menuInfo;
    data["menuTitle"] = menuTitle;
    data["publishedDate"] = publishedDate;
    data["thumbnailUrl"] = thumbnailUrl;
    data["status"] = status;

    return data;
  }
}
