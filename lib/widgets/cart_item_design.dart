import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/models/items.dart';

class CartItemDesign extends StatefulWidget {
  final Items? model;
  final BuildContext? context;
  final int? quantityNumber;

  const CartItemDesign(
      {Key? key, this.model, this.context, this.quantityNumber})
      : super(key: key);

  @override
  State<CartItemDesign> createState() => _CartItemDesignState();
}

class _CartItemDesignState extends State<CartItemDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.cyan,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SizedBox(
          height: 120,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              //image
              Image.network(
                widget.model!.thumbnailUrl!,
                width: 140,
                height: 120,
              ),

              const SizedBox(width: 6),

              //title, quantity number and price.
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // title
                  Text(
                    widget.model!.title!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Kiwi",
                    ),
                  ),
                  const SizedBox(height: 1),

                  //quantity number
                  Row(
                    children: [
                      const Text(
                        "x ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Kiwi",
                        ),
                      ),
                      Text(
                        widget.quantityNumber.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: "Acme",
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      const Text(
                        "Price: ",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      const Text(
                        "\$ ",
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                      Text(
                        widget.model!.price.toString(),
                        style: const TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
