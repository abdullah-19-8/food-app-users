import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../models/global.dart';
import '../provider/cart_item_counter.dart';


separateOrderItemIDs(orderIDs) {
  List<String> separateItemIDsList = [], defaultItemList = [];

  defaultItemList =  List<String>.from(orderIDs);

  for (int i = 0; i < defaultItemList.length; i++) {
    String item = defaultItemList[i].toString();
    var pos = item.lastIndexOf(":");
    String getItemId = (pos != -1) ? item.substring(0, pos) : item;

    print("\n this is itemID now = $getItemId");

    separateItemIDsList.add(getItemId);
  }
  print("\n this is item List now = ");
  print(separateItemIDsList);

  return separateItemIDsList;
}

separateItemIDs() {
  List<String> separateItemIDsList = [], defaultItemList = [];

  defaultItemList = sharedPreferences!.getStringList("userCart")!;

  for (int i = 0; i < defaultItemList.length; i++) {
    String item = defaultItemList[i].toString();
    var pos = item.lastIndexOf(":");
    String getItemId = (pos != -1) ? item.substring(0, pos) : item;

    print("\n this is itemID now = $getItemId");

    separateItemIDsList.add(getItemId);
  }
  print("\n this is item List now = ");
  print(separateItemIDsList);

  return separateItemIDsList;
}

addItemToCart(String? foodItemId, BuildContext context, int itemCounter) {
  List<String>? tempList = sharedPreferences!.getStringList("userCart");
  tempList!.add("${foodItemId!}: $itemCounter");

  FirebaseFirestore.instance
      .collection("users")
      .doc(firebaseAuth.currentUser!.uid)
      .update({
    "userCart": tempList,
  }).then((value) {
    Fluttertoast.showToast(msg: "Item Added Successfully");

    sharedPreferences!.setStringList("userCart", tempList);

    // update the badge
    Provider.of<CartItemCounter>(context,listen: false).displayCartListItemsNumber();
  });
}

separateOrderItemQuantities(orderIDs) {
  List<String> separateItemQuantitiesList = [];
  List<String> defaultItemList = [];

  defaultItemList = List<String >.from(orderIDs);

  for (int i = 1; i < defaultItemList.length; i++) {

    //55565767:7
    String item = defaultItemList[i].toString();

    //7
    List<String> listItemCharacters = item.split(":").toList();

    var quantityNumber = int.parse(listItemCharacters[1].toString());

    print("\n this is Quantity Number = $quantityNumber");

    separateItemQuantitiesList.add(quantityNumber.toString());
  }
  print("\n this is Quantity List now = ");
  print(separateItemQuantitiesList);

  return separateItemQuantitiesList;
}

separateItemQuantities() {
  List<int> separateItemQuantitiesList = [];
      List<String> defaultItemList = [];

  defaultItemList = sharedPreferences!.getStringList("userCart")!;

  for (int i = 1; i < defaultItemList.length; i++) {

    //55565767:7
    String item = defaultItemList[i].toString();

    //7
    List<String> listItemCharacters = item.split(":").toList();

    var quantityNumber = int.parse(listItemCharacters[1].toString());

    print("\n this is Quantity Number = $quantityNumber");

    separateItemQuantitiesList.add(quantityNumber);
  }
  print("\n this is Quantity List now = ");
  print(separateItemQuantitiesList);

  return separateItemQuantitiesList;
}

clearCartNow(context){
  sharedPreferences!.setStringList("userCart", ['garbageValue']);
  List<String>? emptyList = sharedPreferences!.getStringList("userCart");

  FirebaseFirestore.instance.collection("users").doc(firebaseAuth.currentUser!.uid).update(
      {"userCart": emptyList}).then((value) {
    sharedPreferences!.setStringList("userCart", emptyList!);

    Provider.of<CartItemCounter>(context,listen: false).displayCartListItemsNumber();

  });
}

myBoxDecoration(Color color1 ,Color color2){
  return  BoxDecoration(
    gradient: LinearGradient(
      colors: [
        color1,
        color2,
      ],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: const [0.0, 1.0],
      tileMode: TileMode.clamp,
    ),
  );
}