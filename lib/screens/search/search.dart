import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_vscode/model/product_model.dart';
import 'package:flutter_application_vscode/widgets/single_item.dart';

class Search extends StatefulWidget {
  final List<ProductModel> search;
  Search({required this.search});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";

  SearchItems(query) {
    Iterable<ProductModel> SearchFood = widget.search.where((element) {
      return element.ProductName.toLowerCase().contains(query);
    }).toList();
    return SearchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _SearchItems = SearchItems("Query");
    return Scaffold(
        appBar: AppBar(
          title: Text("Search"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.sort),
              ),
            ),
          ],
        ),
        body: ListView(children: [
          ListTile(
            title: Text("Items"),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                print(query);
                //setState(() {
                //query = value;
                //});
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: "Search for items in the store",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: _SearchItems.map((Data) {
              return SingleItem(
                isBool: false,
                ProductImage: Data.ProductImage,
                ProductName: Data.ProductName,
                ProductPrice: Data.productprice,
              );
            }).toList(),
          )
        ]));
  }
}
