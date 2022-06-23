//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_vscode/review/booking_cart.dart';
import 'package:flutter_application_vscode/screens/profile/myprofile.dart';
import 'package:flutter_application_vscode/screens/home/home_screen.dart';
import 'package:flutter_application_vscode/auth/signin.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({Key? key}) : super(key: key);
  Widget listTile(
      {required IconData icon,
      required String title,
      required Function() onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black45),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 43,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 38,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome Guest"),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        height: 50,
                        child: OutlineButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignIn()));
                          },
                          child: Text("Login"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                width: 2,
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            listTile(
                icon: Icons.home_outlined,
                title: "Home",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
            //listTile(Icons.shop_outlined, "Review Cart"),
            listTile(
              icon: Icons.person_outline,
              title: "My Profile",
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyProfile()));
              },
            ),
            listTile(
                icon: Icons.shop_2_outlined,
                title: "Wish List",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BookingCart()));
                }),
            //listTile(Icons.notifications_outlined, "Notification"),
            //listTile(Icons.star_outlined, "Rating and reviews"),
            //listTile(Icons.favorite_outlined, "Wishlist"),
            //listTile(Icons.copy_outlined, "Complaint"),
            //listTile(Icons.format_quote_outlined, "FaQs"),
            //listTile(Icons.more_horiz_outlined, "About"),*/
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Suppot"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Call us"),
                      SizedBox(
                        width: 20,
                      ),
                      Text("+923352588084"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        Text("Mail us"),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Hassanain.okz110@gmail.com"),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
