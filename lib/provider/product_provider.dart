import 'package:flutter/widgets.dart';
import 'package:flutter_application_vscode/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class productProvider with ChangeNotifier {
  List<ProductModel> fetchHostelDataList = [];
  late ProductModel productModel;

  fetchHostelData() async {
    List<ProductModel> newList = [];

    QuerySnapshot HostelValue =
        await FirebaseFirestore.instance.collection("HostelProducts").get();
    HostelValue.docs.forEach(
      (element) {
        //print(element.data());
        productModel = ProductModel(
          ProductName: element.get("ProductName"),
          productprice: element.get("ProductPrice"),
          ProductImage: element.get("ProductImage"),
          //productImage: element.get("ProductImage"),
          //productName: element.get("ProductName"),
          //roductprice: element.get("productPrice")
          // productprice: element.get("Productprice"),
        );
        newList.add(productModel);
      },
    );
    fetchHostelDataList = newList;
    notifyListeners();
  }

  List<ProductModel> get GethostelDataList {
    return fetchHostelDataList;
  }
}
