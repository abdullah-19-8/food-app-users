import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/assistantMethods/assistant_methods.dart';

import '../models/items.dart';
import '../screens/order_details_screen.dart';

class OrderCart extends StatelessWidget {
  final int? itemCount;
  final List<DocumentSnapshot>? data;
  final String? orderID;
  final List<String>? separateQuantitiesList;

  const OrderCart(
      {Key? key,
      this.itemCount,
      this.data,
      this.orderID,
      this.separateQuantitiesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> OrderDetailsScreen(orderID: orderID)));
      },
      child: Container(
        decoration: myBoxDecoration(Colors.black12, Colors.white54),
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        height: itemCount! * 125,
        child: ListView.builder(
          itemCount: itemCount,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Items model =
                Items.fromJson(data![index].data()! as Map<String, dynamic>);
            return placedOrderDesignWidget(
                model, context, separateQuantitiesList![index]);
          },
        ),
      ),
    );
  }
}

Widget placedOrderDesignWidget(
    Items model, BuildContext context, separateQuantitiesList) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 120,
    color: Colors.grey[200],
    child: Row(
      children: [
        Image.network(model.thumbnailUrl!, width: 120),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),

              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      model.title!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Acme",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "\$",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                  Text(
                    model.price.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  const Text(
                    "x ",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  Expanded(
                      child: Text(
                    separateQuantitiesList,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 30,
                      fontFamily: "Acme",
                    ),
                  ))
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
