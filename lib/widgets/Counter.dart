import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Reviewcart_provider.dart';

class Counter extends StatefulWidget {
  String productName;
  String productImage;
  String productId;
  int productPrice;

  //var productUnit;

  Counter({
    required this.productName,
    //required this.productUnit,
    required this.productId,
    required this.productImage,
    required this.productPrice,
  });
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 1;
  bool isTrue = false;

  getAddandQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCartData")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourreviewCart")
        .doc(widget.productId)
        .get()
        .then((value) {
      if (this.mounted) {
        if (value.exists) {
          setState(() {
            isTrue = value.get("isAdd");
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.productId);
    ReviewcartProvider reviewCartProvider =
        Provider.of<ReviewcartProvider>(context);
    return Container(
      height: 25,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isTrue == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (count == 1) {
                      setState(() {
                        isTrue = false;
                      });
                      //reviewCartProvider.reviewCartDataDelete(widget.productId);
                    } else if (count > 1) {
                      setState(() {
                        count--;
                      });
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    size: 15,
                    color: Color(0xffd0b84c),
                  ),
                ),
                Text(
                  "$count",
                  style: TextStyle(
                    color: Color(0xffd0b84c),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                    /*reviewCartProvider.updateReviewCartData(
                      cartId: widget.productId,
                      cartImage: widget.productImage,
                      cartName: widget.productName,
                      cartPrice: widget.productPrice,
                      cartQuantity: count,
                    );*/
                  },
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: Color(0xffd0b84c),
                  ),
                ),
              ],
            )
          : Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTrue = true;
                  });
                  reviewCartProvider.addReviewCartData(
                    cartId: widget.productId,
                    cartName: widget.productName,
                    cartImage: widget.productImage,
                    cartPrice: widget.productPrice,
                    cartQuantity: count,
                    isAdd: true,
                  );

                  //reviewCartProvider.addReviewCartData(CartId: CartId, CartName: CartName, CartImage: CartImage, CartPrice: CartPrice)
                  /*reviewCartProvider.addReviewCartData(
                    cartId: widget.productId,
                    cartImage: widget.productImage,
                    cartName: widget.productName,
                    cartPrice: widget.productPrice,
                    cartQuantity: count,
                    cartUnit: widget.productUnit,
                  );*/
                },
                child: Text(
                  "ADD",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
    );
  }
}
