import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/screens/placed_order_screen.dart';
import '../maps/maps.dart';
import 'package:provider/provider.dart';

import '../provider/address_changer.dart';
import '../models/address.dart';

class AddressDesign extends StatefulWidget {
  final Address? model;
  final int? currentIndex;
  final int? value;
  final String? addressID;
  final double? totalAmount;
  final String? sellerUID;

  const AddressDesign(
      {Key? key,
      this.model,
      this.currentIndex,
      this.value,
      this.addressID,
      this.totalAmount,
      this.sellerUID})
      : super(key: key);

  @override
  State<AddressDesign> createState() => _AddressDesignState();
}

class _AddressDesignState extends State<AddressDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // select this address
        Provider.of<AddressChanger>(context, listen: false)
            .displayCounter(widget.value);
      },
      child: Card(
        color: Colors.cyan.withOpacity(0.4),
        child: Column(
          children: [
            // address info
            Row(
              children: [
                Radio(
                    value: widget.value!,
                    groupValue: widget.currentIndex!,
                    activeColor: Colors.amber,
                    onChanged: (val) {
                      Provider.of<AddressChanger>(context, listen: false)
                          .displayCounter(val);
                    }),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * .8,
                      child: Table(
                        children: [
                          TableRow(
                            children: [
                              const Text(
                                "Name: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.name.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                "Phone Number: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.phoneNumber.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                "Flat Number: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.flatNumber.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                "City: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.city.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                "State: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.state.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                "Full Address: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.phoneNumber.toString()),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            // button
            ElevatedButton(
              onPressed: () {
                MapsUtils.openMapWithPosition(
                    widget.model!.lat!, widget.model!.lng!);
                //MapsUtils.openMapWithAddress(widget.model!.fullAddress!);
              },
              style: ElevatedButton.styleFrom(primary: Colors.black54),
              child: const Text("Check on Maps"),
            ),

            // button
            widget.value == Provider.of<AddressChanger>(context).count
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) => PlacedOrderScreen(
                            addressID: widget.addressID,
                            totalAmount: widget.totalAmount,
                            sellerUID: widget.sellerUID,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: const Text("Proceed"),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
