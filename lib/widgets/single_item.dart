import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class SingleItem extends StatelessWidget {
  //const SingleItem({Key? key}) : super(key: key);
  bool isBool = false;
  String ProductName;
  String ProductImage;
  int ProductPrice;
  String productId;
  int productQuantity;
  Function onDelete;
  SingleItem(
      {required this.isBool,
      required this.ProductImage,
      required this.ProductName,
      required this.ProductPrice,
      required this.productId,
      required this.productQuantity,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            Expanded(
                child: Container(
              height: 100,
              child: Center(
                child: Image.network(ProductImage),
              ),
            )),
            Expanded(
                child: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: isBool == false
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        ProductName,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "$ProductPrice\RS",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.only(right: 15),
                      padding: EdgeInsets.only(left: 10),
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                          //border: Border.all(color: Colors.black),
                          //borderRadius: BorderRadius.circular(15)
                          ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            " ",
                          ))
                        ],
                      ),
                    ),
                  )
                ],
                //child : Image.network(""),
              ),
            )),
            Expanded(
                child: Container(
                    padding: isBool == false
                        ? EdgeInsets.symmetric(vertical: 32, horizontal: 15)
                        : EdgeInsets.only(left: 15, right: 15),
                    height: 90,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: isBool == false
                        ? Container(
                            //alignment: Alignment.center,
                            height: 2,
                            width: 2,
                            child: Container(
                                height: 45,
                                width: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: Colors.white,
                                    )),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.book_online,
                                        color: Colors.blue,
                                        size: 20,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          "Book now",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              InkWell(
                                onTap: () => onDelete(),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Colors.white,
                                      )),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.book_online,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ))),
          ],
        ),
      ),
    ]);
  }
}
