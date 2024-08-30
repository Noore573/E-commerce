import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'package:untitled4/modules/Women/Women_controller.dart';
class Women extends StatelessWidget {

  //WomenController controller= Get.find();
  List<ProductItem> itemss=[
    ProductItem(
      AssetImage:'images/5.jpg',title:'GUCCI',subtitle:'\$200',
    ),
    ProductItem(
      AssetImage:'images/5.jpg',title:'Zara',subtitle:'\$100',
    ),
    ProductItem(
      AssetImage:'images/5.jpg',title:'GUCCI',subtitle:'\$88',
    ),
    ProductItem(
      AssetImage:'images/5.jpg',title:'GUCCI',subtitle:'\$100',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children:[
          SizedBox(height: 180,width: double.infinity,child:Image.asset('images/5.jpg'), ),
          SizedBox(height: 20,),
          Container(
          child:Center(child: Text("Shop by Catagory",style: TextStyle(color: Colors.black,fontSize: 20),))
        ),
          SizedBox(height: 20,),
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child:  Row(
    children: [
      SizedBox(width: 20,),
      Container(height: 70,

        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white60),
      child: InkWell(onTap: (){Get.toNamed("/dress");},child:Image.asset('images/5.jpg',)),
      ),
      Container(height: 70,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white60),
        child: Image.asset('images/5.jpg'),
      ),
      Container(height: 70,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white60),
        child: Image.asset('images/5.jpg'),
      ),
      Container(height: 70,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white60),
        child: Image.asset('images/5.jpg'),
      ),
     ] )),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:  Row(
                
                  children: [
                    SizedBox(width: 20,),
                    Container(height: 70,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white60),
                      child: Image.asset('images/5.jpg'),
                    ),
                    Container(height: 70,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white60),
                      child: Image.asset('images/5.jpg'),
                    ),
                    Container(height: 70,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white60),
                      child: Image.asset('images/5.jpg'),
                    ),
                    Container(height: 70,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white60),
                      child: Image.asset('images/5.jpg'),
                    ),
                  ] )),
SizedBox(height: 30,),
          Container(
              child:Center(child: Text("Deal of the Day",style: TextStyle(color: Colors.black,fontSize: 20),))
          ),
          Container(
           child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
             children: [
               Text("Flash Sale"),
               Text("time"),
             ],),
          ),
          Container(
            height: 256,

            child:
            ListView.separated(
              padding: EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (context,_)=>SizedBox(height: 80,width: 12,),
              itemBuilder: (context,index)=>ProductCard(item:itemss[index] ),),),
    //       Container(
    //         height: 256,

    //         child:
    //         ListView.separated(
    //           padding: EdgeInsets.all(16),
    //           scrollDirection: Axis.horizontal,
    //           itemCount: 4,
    //           separatorBuilder: (context,_)=>SizedBox(height: 80,width: 12,),
    //           itemBuilder: (context,index)=>ProductCard(item:itemss[index] ),),),

     ])
     );
  }
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
