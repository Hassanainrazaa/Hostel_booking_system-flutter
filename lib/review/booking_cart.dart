import 'package:flutter/material.dart';
import 'package:flutter_application_vscode/model/review_cartmodel.dart';
import 'package:flutter_application_vscode/provider/Reviewcart_provider.dart';
import 'package:flutter_application_vscode/widgets/single_item.dart';
import 'package:provider/provider.dart';

class BookingCart extends StatelessWidget {
  late ReviewcartProvider reviewCartprovider;
  showAlertDailouge(BuildContext context, ReviewCartModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        Navigator.of(context).pop();
        reviewCartprovider.reviewCartDeleteData(delete.cartId);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Card product"),
      content: Text("Product delete or not ? "),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    reviewCartprovider = Provider.of(context);
    reviewCartprovider.getReviewCartData();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booking Cart",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: reviewCartprovider.getReviewCartDataList.isEmpty
          ? Center(
              child: Text("No Data"),
            )
          : ListView.builder(
              itemCount: reviewCartprovider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewCartprovider.getReviewCartDataList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SingleItem(
                        isBool: true,
                        ProductImage: data.cartImage,
                        ProductName: data.cartName,
                        ProductPrice: data.cartPrice,
                        productId: data.cartId,
                        productQuantity: data.cartQuantity,
                        onDelete: () {
                          showAlertDailouge(context, data);
                        })
                  ],
                );
              }),
    );
  }
}
