import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

import '../assistantMethods/assistant_methods.dart';
import '../models/items.dart';
import '../widgets/app_bar.dart';

class ItemDetailScreen extends StatefulWidget {
  final Items? model;

  const ItemDetailScreen({Key? key, this.model}) : super(key: key);

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  TextEditingController counterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(sellerUID: widget.model!.sellersUid),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Image.network(widget.model!.thumbnailUrl.toString()),
          ),
          Expanded(
            flex: 11,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: NumberInputPrefabbed.roundedButtons(
                    controller: counterController,
                    incDecBgColor: Colors.amber,
                    min: 1,
                    max: 9,
                    initialValue: 1,
                    buttonArrangement: ButtonArrangement.incRightDecLeft,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.model!.title.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.model!.description.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    " ${widget.model!.price} \$",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: InkWell(
                    onTap: () {
                      int itemCounter = int.parse(counterController.text);

                      List<String> separateItemIDsList = separateItemIDs()!;

                      //1. check if item already exist in cart.
                      separateItemIDsList.contains(widget.model!.itemId)
                          ? Fluttertoast.showToast(
                              msg: "Item is Already in Cart")
                          : //2. add item to cart.
                      addItemToCart(
                              widget.model!.itemId, context, itemCounter);
                    },
                    child: Container(
                      decoration: myBoxDecoration(Colors.amber,Colors.cyan),
                      width: MediaQuery.of(context).size.width - 15,
                      height: 50,
                      child: const Center(
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
