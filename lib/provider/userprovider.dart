import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  void addUserData({
    required User currentUser,
    required String userEmail,
    required String userImage,
    required String userName,
  }) async {
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(currentUser.uid)
        .set({
      "userName": userName,
      "userEmail": userEmail,
      "userImage": userImage,
      "userUId": currentUser.uid,
    });
  }
}
