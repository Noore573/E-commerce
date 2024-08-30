// import 'package:flutter/material.dart';
// // import 'package:untitled4/modules/Dress/Dress.dart';
// // import 'package:untitled4/modules/Details/Details.dart';
// // import 'package:untitled4/components/custom_button.dart';
// import 'package:get/get.dart';
// import 'package:project2/Dress.dart';
// class Body extends StatelessWidget {

// final Product product;

//   const Body({super.key, required this.product});
//   @override
//   Widget build(BuildContext context) {
//     Size size=MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
// SizedBox(height: size.height,
// child: Stack(
//     children:<Widget>[
//       Container(
//         margin: EdgeInsets.only(top: size.height*3),
//         padding: EdgeInsets.only(top: size.height*0.12,left: 8,right: 8),
//         height: 500,
//         decoration: BoxDecoration(color: Colors.white,
// borderRadius: BorderRadius.only(topLeft: Radius.circular(24),
// topRight: Radius.circular(24),
// )
//         ),
//         child: Column(
//           children: [
//             Row(children: <Widget>[
//               Column(children:<Widget> [
//                 Text("Color"),
//                 Container(
//                   margin: EdgeInsets.only(top: 8/4,right: 8/2),

//                   padding: EdgeInsets.all(2.5),
//                   height: 24,width: 24,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Color(0xFF35c6c95),


//                 )),
//                 child: DecoratedBox(decoration: BoxDecoration(
//                   color: Color(0xFF35c6c95),
//                   shape: BoxShape.circle,
//                 ),),

//                 )
//               ],)

//             ],),
//           ],
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[

//             Text("White Gucci Dress",style: TextStyle(color: Colors.white),),
//               Text(product.title,style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white,
//               fontWeight: FontWeight.bold
//               ),),
//             SizedBox(height: 8,),
//             Row(children:<Widget> [
//               Expanded(
//                 child: RichText(text: TextSpan(children: [
//                   TextSpan(text: "Price"),
//                   TextSpan(text: "\$${product.subtitle}",style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white,
//                       fontWeight: FontWeight.bold),),
//                   TextSpan(text: "${product.size}",style: Theme.of(context).textTheme.headline5?.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ))


//                 ])),
//               ),
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8/2),
//                     child: Text(product.description),

//                   ),
//                    CartCounter(),
//                 ],
//               ),

//               SizedBox(width: 8,),
//               Expanded(child: Image.asset(product.AssetImage,fit: BoxFit.fitWidth,)),
//             ],),

// SizedBox(child: ElevatedButton(onPressed: (){}, child: Text("Buy Now"),),
//         width: 20,height: 40,
// ),


//           ],
//         ),
//       )

//     ]
        
// )


// ,)
//         ],
//       ),
//     );
//   }
// }
// class CartCounter extends StatefulWidget {
//   const CartCounter({Key? key}) : super(key: key);

//   @override
//   State<CartCounter> createState() => _CartCounterState();
// }

// class _CartCounterState extends State<CartCounter> {
//   int numOfItem=1;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         SizedBox(width: 40,height: 32,
//         child: OutlinedButton(
          
//           onPressed: (){},
//         child: Icon(Icons.remove),
//         ),),
//       ],
//     );
//   }
// }

