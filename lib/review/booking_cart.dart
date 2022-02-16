import 'package:flutter/material.dart';
import 'package:flutter_application_vscode/widgets/single_item.dart';

class BookingCart extends StatelessWidget {
  const BookingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booking Cart",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          SingleItem(
              isBool: true,
              ProductImage: "ProductImage",
              ProductName: "ProductName",
              ProductPrice: 145),
          SingleItem(
              isBool: true,
              ProductImage: "ProductImage",
              ProductName: "ProductName",
              ProductPrice: 145),
          SingleItem(
              isBool: true,
              ProductImage: "ProductImage",
              ProductName: "ProductName",
              ProductPrice: 145),
          SingleItem(
              isBool: true,
              ProductImage: "ProductImage",
              ProductName: "ProductName",
              ProductPrice: 145),
          SingleItem(
              isBool: true,
              ProductImage: "ProductImage",
              ProductName: "ProductName",
              ProductPrice: 145),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
