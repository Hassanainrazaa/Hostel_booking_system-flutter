import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_vscode/config/color.dart';

enum SinginCharacter { fill, outline }

class productOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  final int ProductPrice;
  productOverview(
      {required this.productImage,
      required this.productName,
      required this.ProductPrice});
  static String id = "productoverview";
  @override
  _productOverviewState createState() => _productOverviewState();
}

class _productOverviewState extends State<productOverview> {
  SinginCharacter _character = SinginCharacter.fill;

  Widget bonntonNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
    required Function onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap(),
        child: Container(
          padding: EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bonntonNavigatorBar(
              iconColor: Colors.white,
              backgroundColor: Colors.black87,
              color: Colors.white,
              title: "Book now",
              iconData: Icons.access_time_rounded,
              onTap: () {}),
          bonntonNavigatorBar(
              iconColor: Colors.white,
              backgroundColor: Colors.blue,
              color: Colors.white,
              title: "Add to list",
              iconData: Icons.favorite_border_outlined,
              onTap: () {}),
        ],
      ),
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Product overview",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(widget.productName),
                      subtitle: Text("\R${widget.ProductPrice}"),
                    ),
                    Container(
                      height: 250,
                      padding: EdgeInsets.all(40),
                      child: Image.network(
                        widget.productImage,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      child: Text(
                        "Available Options",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: textColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green[700],
                              ),
                            ],
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.all(20),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "About the Product",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
