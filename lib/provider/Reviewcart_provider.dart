import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_vscode/model/review_cartmodel.dart';
import 'package:flutter_application_vscode/model/review_cartmodel.dart';
import 'package:flutter_application_vscode/model/review_cartmodel.dart';

import '../model/review_cartmodel.dart';

class ReviewcartProvider with ChangeNotifier {
  void addReviewCartData({
    required String cartId,
    required String cartName,
    required String cartImage,
    required int cartPrice,
    required int cartQuantity,
    required bool isAdd,
  }) async {
    FirebaseFirestore.instance
        .collection("ReviewCartData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourreviewCart")
        .doc(cartId)
        .set({
      "cartId": cartId,
      "cartName": cartName,
      "cartImage": cartImage,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity,
      "isAdd": true,
    });
  }

  List<ReviewCartModel> reviewCartDataList = [];
  void getReviewCartData() async {
    List<ReviewCartModel> newList = [];

    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("ReviewCartData")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourreviewCart")
        .get();
    reviewCartValue.docs.forEach((element) {
      ReviewCartModel reviewCartModel = ReviewCartModel(
        cartId: element.get("cartId"),
        cartImage: element.get("cartImage"),
        cartName: element.get("cartName"),
        cartPrice: element.get("cartPrice"),
        cartQuantity: element.get("cartQuantity"),
      );
      newList.add(reviewCartModel);
    });
    reviewCartDataList = newList;
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCartDataList {
    return reviewCartDataList;
  }

///////////////////Delete review Cart ////////////////////////

  reviewCartDeleteData(cartId) {
    FirebaseFirestore.instance
        .collection("ReviewCartData")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourreviewCart")
        .doc(cartId)
        .delete();
    notifyListeners();
  }
}
