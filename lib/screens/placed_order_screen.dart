import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodpanda_users_app/assistantMethods/assistant_methods.dart';
import 'package:foodpanda_users_app/models/global.dart';
import 'package:foodpanda_users_app/screens/home_screen.dart';

class PlacedOrderScreen extends StatefulWidget {
  final String? addressID;
  final double? totalAmount;
  final String? sellerUID;

  const PlacedOrderScreen(
      {Key? key, this.addressID, this.totalAmount, this.sellerUID})
      : super(key: key);

  @override
  State<PlacedOrderScreen> createState() => _PlacedOrderScreenState();
}

class _PlacedOrderScreenState extends State<PlacedOrderScreen> {
  String? orderId = DateTime.now().millisecondsSinceEpoch.toString();

  addOrderDetails() {
    writeOrderDetailsForUser({
      "addressID": widget.addressID,
      "totalAmount": widget.totalAmount,
      "orderBy": sharedPreferences!.getString("uid"),
      "productsIDs": sharedPreferences!.getStringList("userCart"),
      "PaymentDetails": "Cash On Delivery",
      "orderTime": orderId,
      "isSuccess": true,
      "sellerUID": widget.sellerUID,
      "riderUID": "",
      "status": "normal",
      "orderId": orderId,
    });
    writeOrderDetailsForSeller({
      "addressID": widget.addressID,
      "totalAmount": widget.totalAmount,
      "orderBy": sharedPreferences!.getString("uid"),
      "productsIDs": sharedPreferences!.getStringList("userCart"),
      "PaymentDetails": "Cash On Delivery",
      "orderTime": orderId,
      "isSuccess": true,
      "sellerUID": widget.sellerUID,
      "riderUID": "",
      "status": "normal",
      "orderId": orderId,
    }).whenComplete(() {
      clearCartNow(context);

      setState(() {
        orderId = "";
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => const HomeScreen(),
          ),
        );
      });
      Fluttertoast.showToast(msg: "Congratulations, Order has been places successfully.");
    });
  }

  Future writeOrderDetailsForUser(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(sharedPreferences!.getString("uid"))
        .collection("orders")
        .doc(orderId)
        .set(data);
  }

  Future writeOrderDetailsForSeller(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection("orders")
        .doc(orderId)
        .set(data);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: myBoxDecoration(Colors.amber,Colors.cyan),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/delivery.jpg"),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                addOrderDetails();
              },
              style: ElevatedButton.styleFrom(primary: Colors.cyan),
              child: const Text("Place order"),
            )
          ],
        ),
      ),
    );
  }
}
