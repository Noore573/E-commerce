import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:project2/Home.dart';

//import 'package:untitled4/modules/Women/Women_controller.dart';
class Women1 extends StatelessWidget {

  List<CardItem> data=Get.arguments;
  //WomenController controller= Get.find();
  final  List<Map<String,dynamic>> gridMap=[
   { "AssetImage":'images/4.jpg',
      "title":'Women Dress',
      "subtitle":"a very good quality","price":'\$200'},
    { "AssetImage":'images/4.jpg',
      "title":'Women Shirt',
      "subtitle":"a very good quality","price":'\$60'},
  ];
  final  List<Map<String,dynamic>> lapMap=[
    { "AssetImage":'images/4.jpg',
      "title":'Women Shoes',
      "subtitle":"a very good quality","price":'\$200'},
    { "AssetImage":'images/4.jpg',
      "title":'Women Shirt',
      "subtitle":"a very good quality","price":'\$280'},
  ];
  List<ProductItem> itemss=[
    ProductItem(
      AssetImage:'images/4.jpg',title:'GUCCI',subtitle:'\$200',
    ),
    ProductItem(
      AssetImage:'images/4.jpg',title:'Zara',subtitle:'\$100',
    ),
    ProductItem(
      AssetImage:'images/4.jpg',title:'GUCCI',subtitle:'\$88',
    ),
    ProductItem(
      AssetImage:'images/4.jpg',title:'GUCCI',subtitle:'\$100',
    ),
  ];

  late double _rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
         children:[
          Row(
            children: [
              Container(
                height: 50,
                child:Text("${data[0].title}")
              ),
            ],
          ),
          Container(height: 180,width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
            color: Colors.amberAccent),
            child:Image.asset('images/4.jpg'), ),
          SizedBox(height: 20,),
          Container(
          child:Center(child: Text("Shop by Catagory",style: TextStyle(color: Colors.black,fontSize: 20),))
        ),
          SizedBox(height: 20,),
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child:  Row(
    children: [
      Container(height: 70,

        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white60),
      child: InkWell(onTap: (){Get.toNamed("/dress");},child:Image.asset('images/4.jpg',)),
      ),
      Container(height: 70,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white60),
        child: InkWell(onTap:(){Get.toNamed("/shoes");},child: Image.asset('images/4.jpg')),
      ),
      Container(height: 70,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white60),
        child: InkWell(onTap:(){Get.toNamed("/pants");},child: Image.asset('images/4.jpg')),
      ),
      Container(height: 70,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white60),
        child: InkWell(onTap:(){Get.toNamed("/hats");}, child: Image.asset('images/5.jpg')),
      ),
     ] )),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:  Row(
                  children: [
                    Container(height: 70,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white60),
                      child: InkWell(onTap: (){Get.toNamed("/watch");},child: Image.asset('images/4.jpg')),
                    ),
                    Container(height: 70,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white60),
                      child: InkWell(onTap: (){Get.toNamed("/shorts");},child: Image.asset('images/4.jpg')),
                    ),
                    Container(height: 70,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white60),
                      child: InkWell(onTap: (){Get.toNamed("/bags");},child: Image.asset('images/4.jpg')),
                    ),
                    Container(height: 70,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white60),
                      child: InkWell(onTap: (){Get.toNamed("/jacket");},child: Image.asset('images/4.jpg')),
                    ),
                  ] )),
SizedBox(height: 30,),
          Container(
              child:Center(child: Text("Deal of the Day",style: TextStyle(color: Colors.black,fontSize: 20),))
          ),
          SizedBox(height: 10,),
          Container(
           child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
             children: [
               Text("Flash Sale",style: TextStyle(fontSize: 20),),
               Text("time",style: TextStyle(fontSize: 20),),
             ],),
          ),
           SizedBox(height: 20,),
           GridView.builder(
               physics: const NeverScrollableScrollPhysics(),
               shrinkWrap:true,
               gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                 crossAxisSpacing:12.0,
                 mainAxisSpacing:12.0,
                 mainAxisExtent: 300,
               ),
               itemCount:gridMap.length,
               itemBuilder:(context,index){
                 return  InkWell(
                   onTap: (){Get.toNamed("/productdetail",arguments:gridMap);},
                  
                   child:
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(16.0),
                       color: Colors.white,
                     ),
                     child: Column(children: [
                       ClipRRect(borderRadius: const BorderRadius.only(topLeft:Radius.circular(16.0),topRight: Radius.circular(16.0),),
                         child: Image.asset("${gridMap.elementAt(index)[ 'AssetImage']}",height: 170,
                           fit: BoxFit.cover,
                           width: double.infinity,
                         ),),
                       Padding(padding: const EdgeInsets.all(8.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("${gridMap.elementAt(index)[ 'title']}",style: Theme.of(context).textTheme.headline5,),
                             const SizedBox(height: 8.0,),
                             Text("${gridMap.elementAt(index)[ 'subtitle']}",style: Theme.of(context).
                             textTheme.subtitle1?.merge(const TextStyle(fontWeight: FontWeight.w500,color: Colors.black45)),),
                             const SizedBox(height: 8.0,),
                             Container(
                               alignment: Alignment.centerLeft,
                               child: GFRating(
                                 size: 18,
                                 color: Colors.amber,
                                 value:4,
                                 onChanged: (value){
                                   setState(() {_rating=value;});

                                 },
                               ),
                             ),
                             SizedBox(height: 3,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text("${gridMap.elementAt(index)[ 'price']}",style: Theme.of(context).
                                 textTheme.subtitle1?.merge(const TextStyle(fontWeight: FontWeight.w500,color: Colors.red),),),
                                 InkWell(onTap: (){},child: Icon(Icons.favorite,color: Colors.red,))
                               ],
                             ),
                            // const SizedBox(height: 8.0,),
                           ],
                         ),
                       )
                     ],),

                   ),


                 );
               }
           ),
           SizedBox(height: 20,),
           GridView.builder(
               physics: const NeverScrollableScrollPhysics(),
               shrinkWrap:true,
               gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                 crossAxisSpacing:12.0,
                 mainAxisSpacing:12.0,
                 mainAxisExtent: 300,
               ),
               itemCount:lapMap.length,
               itemBuilder:(context,index){
                 return  InkWell(
                   onTap: (){Get.toNamed("/productdetail",arguments: {
                     "AssetImage":'images/4.jpg',
                     "title":'Women Shoes',
                     "subtitle":"a very good quality","price":'\$200'

                   });},
                   child:
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(16.0),
                       color: Colors.white,
                     ),
                     child: Column(children: [
                       ClipRRect(borderRadius: const BorderRadius.only(topLeft:Radius.circular(16.0),topRight: Radius.circular(16.0),),
                         child: Image.asset("${lapMap.elementAt(index)[ 'AssetImage']}",height: 170,
                           fit: BoxFit.cover,
                           width: double.infinity,
                         ),),
                       Padding(padding: const EdgeInsets.all(8.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("${lapMap.elementAt(index)[ 'title']}",style: Theme.of(context).textTheme.headline5,),
                             const SizedBox(height: 8.0,),
                             Text("${lapMap.elementAt(index)[ 'subtitle']}",style: Theme.of(context).
                             textTheme.subtitle1?.merge(const TextStyle(fontWeight: FontWeight.w500,color: Colors.black45)),),
                             const SizedBox(height: 8.0,),
                             Container(
                               alignment: Alignment.centerLeft,
                               child: GFRating(
                                 size: 18,
                                 color: Colors.amber,
                                 value:4,
                                 onChanged: (value){
                                   setState(() {_rating=value;});

                                 },
                               ),
                             ),
                             SizedBox(height: 3,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text("${lapMap.elementAt(index)[ 'price']}",style: Theme.of(context).
                                 textTheme.subtitle1?.merge(const TextStyle(fontWeight: FontWeight.w500,color: Colors.red),),),
                                 InkWell(onTap: (){},child: Icon(Icons.favorite,color: Colors.red,))
                               ],
                             ),

                            // const SizedBox(height: 8.0,),
                           ],
                         ),
                       )
                     ],),

                   ),


                 );
               }
           ),
          /*Container(
            height: 256,

            child:
            ListView.separated(
              padding: EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (context,_)=>SizedBox(height: 80,width: 12,),
              itemBuilder: (context,index)=>ProductCard(item:itemss[index] ),),),*/

    ]


    ));

  }

  void setState(Null Function() param0) {}
}




Widget ProductCard( {required ProductItem item,})
=> Container(
  width: 200,
  child:Column(
    children: [
      Expanded(child:
      AspectRatio(
        aspectRatio:4/3,
        child:ClipRRect(
            borderRadius:BorderRadius.circular(40),
            child:Material(child:Ink.image(image: AssetImage(item.AssetImage),fit: BoxFit.cover,
                child:InkWell(onTap: (){})




            ),)),),),
      const SizedBox(height: 4,),
      Text(item.title,style: TextStyle(color: Colors.black,fontSize: 20,),),
      Text(item.subtitle,style: TextStyle(color: Colors.grey,fontSize: 16),),
    ],
  ),);

class ProductItem {
  final String AssetImage;
  final String title;
  final String subtitle;

  const ProductItem({
    required this.AssetImage,
    required this.title,
    required this.subtitle,

  });

}
