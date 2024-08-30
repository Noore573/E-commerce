import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset("images/5.jpg",fit: BoxFit.fill,)),
          Positioned(
            top: 10  ,
             
            child: Container(
                width: 300, height: 300, child: Image.asset("images/sale.png",fit: BoxFit.fill,)),
          ),
        ],
      ),
      color: Colors.red,
    );
  }
}
