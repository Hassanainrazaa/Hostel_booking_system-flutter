import 'package:flutter/material.dart';

Widget flatProduct() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    height: 230,
    width: 160,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Image.network(
              "https://image.shutterstock.com/image-vector/hostel-logo-hotel-travel-rest-260nw-727553170.jpg"),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                "Hostels",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                "RS 8000 per month",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
