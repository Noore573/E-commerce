import 'package:flutter/material.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  double oblevel=1.0;
  @override
  Widget build(BuildContext context) {
    
    
    return SafeArea(
      child: Column(
        children: [
          AnimatedOpacity(opacity: oblevel, duration: Duration(seconds: 2),
          curve: Curves.bounceOut,
          child: FlutterLogo(
            size: 50,
          ),
          ),
          ElevatedButton(onPressed: (){
          setState(() =>oblevel=oblevel==0?1.0:0.0 ,);
          }, child: Text('click me'))
        ],
      ),
    );
  }
}