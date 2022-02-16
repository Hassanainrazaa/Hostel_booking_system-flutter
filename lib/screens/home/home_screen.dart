//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_application_vscode/provider/product_provider.dart';
import 'package:flutter_application_vscode/review/booking_cart.dart';
import 'package:flutter_application_vscode/screens/home/singleproduct.dart';
import 'package:flutter_application_vscode/screens/home/productoverview/productoverview.dart';
import 'drawerside.dart';
import "package:provider/provider.dart";
import 'package:flutter_application_vscode/screens/search/search.dart';
import 'package:flutter_application_vscode/provider/product_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = "home_screen";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late productProvider ProductProvider;
  /*Widget SingalProduct() {
    final String productImage;
    final String productName;
    final Function onTab;

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
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
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
  }*/

  Widget resortProduct() {
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
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
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

  Widget flatProduct(context) {
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
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
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

  Widget listTile(IconData icon, String title) {
    return ListTile(
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
  void initState() {
    productProvider ProductProvider = Provider.of(
      context,
      listen: false,
    );
    ProductProvider.fetchHostelData();
    //initproductProvider.fatchHerbsProductData();
    //initproductProvider.fatchFreshProductData();
    //initproductProvider.fatchRootProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider = Provider.of(
      context,
    );
    //pp.fetchHostelData();
    return Scaffold(
      drawer: DrawerSide(),
      backgroundColor: Color(0xffcbcbcb1),
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xffcbcbcb1),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Search(
                      search: [],
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                size: 17,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Color(0xffcbcbcb1),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BookingCart()));
                },
                icon: Icon(
                  Icons.shop,
                  size: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(children: [
          Container(
            // Wallimage
            height: 155,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://cache.marriott.com/marriottassets/marriott/ISBPK/isbpk-guestroom-3941-hor-feat.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1180px:*'),
              ),
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
          ),
          Padding(
            //text up on photos
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hostels',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Search(
                        search: ProductProvider.fetchHostelDataList,
                      ),
                    ));
                  },
                  child: Text(
                    "View all",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ProductProvider.GethostelDataList.map((hostelData) {
                return SingleProduct(
                    productImage: hostelData.ProductImage,
                    productName: hostelData.ProductName,
                    ProductPrice: hostelData.productprice,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => productOverview(
                          productImage: hostelData.ProductImage,
                          productName: hostelData.ProductName,
                          ProductPrice: hostelData.productprice,
                        ),
                      ));
                    });
              }).toList(),
            ),
          ),
          Padding(
            //text up on photos
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Resorts',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "View all",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                resortProduct(),
                resortProduct(),
                resortProduct(),
                resortProduct()
              ],
            ),
          ),
          Padding(
            //text up on photos
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Resorts',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "View all",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                flatProduct(context),
                flatProduct(context),
                flatProduct(context),
                flatProduct(context)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
