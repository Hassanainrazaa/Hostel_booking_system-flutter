import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_vscode/screens/home/productoverview/productoverview.dart';
import 'package:flutter_application_vscode/widgets/Counter.dart';
//import 'package:';

class SingleProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final Function onTap;
  final String productId;
  const SingleProduct(
      {required this.productId,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 230,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => productOverview(
                        productImage: productImage,
                        productName: productName,
                        ProductPrice: productPrice,
                      ),
                    ));
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    child: Image.network(productImage),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        productName,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\RS$productPrice",
                        style: TextStyle(color: Colors.grey),
                      ),
                      // TextButton(onPressed: () {}, child: Text("ADD")),
                      Counter(
                          productName: productName,
                          //productUnit: productUnit,
                          productId: productId,
                          productImage: productImage,
                          productPrice: productPrice)
                    ],
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
