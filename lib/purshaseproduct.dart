import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
double _rating = 3;
class PurchaseProduct extends StatefulWidget {
  const PurchaseProduct({super.key});

  @override
  State<PurchaseProduct> createState() => _PurchaseProductState();
}

class _PurchaseProductState extends State<PurchaseProduct> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height:200),
          Container(
            child:
    GFRating(
          value: _rating,
          onChanged: (value) {
          setState(() {
            _rating = value;
          });
          },
    ),
          ),
        ],
      ),
    );
  }
}