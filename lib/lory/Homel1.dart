import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

// import 'package:untitled4/components/custom_text.dart';
// import 'package:untitled4/modules/Home/Home_controller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class Homel1 extends StatelessWidget {

  var selectedType="Dress";
  final List<String> names=<String>['dresses','shorts','pants','shirts','hats','bags'];
  List<CardItem> items=[
    CardItem(
      AssetImage:'images/5.jpg',title:'Nike',subtitle:'\$99',
    ),
    CardItem(
      AssetImage:'images/5.jpg',title:'White Shirt',subtitle:'\$75',
    ),

    CardItem(
      AssetImage:'images/5.jpg',title:'Zara',subtitle:'\$99',
    ),

    CardItem(
      AssetImage:'images/5.jpg',title:'GUCCI',subtitle:'\$100',
    ),];
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
bottomNavigationBar:
 // Padding(
   // padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
//child:
     GNav(
      backgroundColor: Colors.white,
      color: Colors.black,
      activeColor: Colors.black,
      tabBackgroundColor: Colors.black38,
      padding: EdgeInsets.all(8),
      gap: 8,
      tabs:const [
        GButton(icon: Icons.home,text: "Home",),
       GButton(icon: Icons.person_rounded,text: "Profile"),
        GButton(icon: Icons.card_travel,text: "Card",),
        GButton(icon: Icons.settings,text: "Settings",),
      ],
      onTabChange: index(print( "index")),
     ),


        appBar: AppBar(
          elevation: 6.0,
          shape: ContinuousRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(90.0),)),
          backgroundColor: Colors.white,
          actions: [IconButton(onPressed: (){showSearch(context: context, delegate:Search() );},
              icon: Icon(Icons.search,color: Colors.black,))],

        ),

        body: new ListView(
          children:<Widget>[
            SizedBox(height:20,),
            _ListViewCategory(),






            SizedBox(height: 30,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Best Selling",style:TextStyle(fontSize: 18,)),
                Text("See all",style:TextStyle(fontSize: 18,))
              ],),
            SizedBox(height: 20,),
            Container(
              height: 256,

              child:
              ListView.separated(
                padding: EdgeInsets.all(16),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (context,_)=>SizedBox(width: 12,),
                itemBuilder: (context,index)=>buildCard(item:items[index] ),),),
            Container(
              child: Image.asset('images/5.jpg'),),
            SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Top Sale",style:TextStyle(fontSize: 18,)),
                Text("See all",style:TextStyle(fontSize: 18,))
              ],),
            Container(
              height: 256,

              child:
              ListView.separated(
                padding: EdgeInsets.all(16),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (context,_)=>SizedBox(width: 12,),
                itemBuilder: (context,index)=>ProductCard(item:itemss[index] ),),),



            //  child:


          ],
        )








    );
  }


  Widget buildCard( {required CardItem item,})
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
    ),
    //Image.asset(item.AssetImage,fit: BoxFit.cover,)
  );

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


  ShoePage({required CardItem item}) {}

  Widget _ListViewCategory() {

    return Container(height: 100,
      child: ListView.separated(
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return Column(
            children: [
              InkWell(onTap: (){Get.toNamed("/dress");},
                child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                        color: Colors.black54),
                    height: 60,
                    width: 60,
                    child:Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.asset('images/5.jpg'),

                    )
                ),
              ),
              SizedBox(height: 20,),
              Text( names[index],)
            ],
          );
        }, separatorBuilder: ( context, int index)=>SizedBox(width: 20,),
      ),
    );
  }

  index(void print) {}
}








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






class CardItem {
  final String AssetImage;
  final String title;
  final String subtitle;


  const CardItem({
    required this.AssetImage,
    required this.title,
    required this.subtitle,

  });
}

class Search extends SearchDelegate{
  List names=[
    "dress","shorts","pants","shoes","hats"
  ];


  @override
  List<Widget>? buildActions(BuildContext context) {
    return[IconButton(onPressed: (){
      query="";
    },
        icon: Icon(Icons.close))];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){close(context, null);},
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("$query");
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List filternames=names.where((element) => element.contains(query)).toList();


    return ListView.builder(
        itemCount: query==""? names.length:filternames.length,
        itemBuilder:(context,i){
          return InkWell(
            onTap: (){
              query=query==""? names[i]:filternames[i];
            },
            child: Container(
                padding: EdgeInsets.all(10),
                child: query==""? Text("${names[i]}", style: TextStyle(fontSize: 25),):
                Text("${filternames[i]}",style: TextStyle(fontSize: 25),)
            ),
          );


        });}}



// _ListViewProducts(),















 /* Widget bottomNavigationBar() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller)=>
       BottomNavigationBar(items:
      [BottomNavigationBarItem(
        activeIcon: Text("Explore"),
        label: '',
         icon: InkWell(onTap: (){Get.toNamed("/home");},
             child: Icon(Icons.home_filled,)),),
        BottomNavigationBarItem(
          activeIcon: Text("cart"),
          label: '',
          icon: InkWell(onTap: (){Get.toNamed("/cart");},child: Icon(Icons.card_travel,)),),
        BottomNavigationBarItem(
          activeIcon: Text("Profile"),
          label: '',
          icon: InkWell(onTap: (){Get.toNamed("/profile");},child: Icon(Icons.person_rounded,)),),
      ],
      currentIndex: controller.navigatorvalue,
        onTap: (index)=>controller.changeSelectedValue(index),


      ),
    );
  }
*/




















/*
class Search extends SearchDelegate{
  List names=[
    "dress","shorts","pants","shoes","hats"
  ];


  @override
  List<Widget>? buildActions(BuildContext context) {
 return[IconButton(onPressed: (){
   query="";
 },
     icon: Icon(Icons.close))];
  }
  @override
  Widget? buildLeading(BuildContext context) {
return IconButton(onPressed: (){close(context, null);},
    icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
  return Text("$query");
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List filternames=names.where((element) => element.contains(query)).toList();


   return ListView.builder(
     itemCount: query==""? names.length:filternames.length,
     itemBuilder:(context,i){
       return InkWell(
         onTap: (){
           query=query==""? names[i]:filternames[i];
         },
         child: Container(
             padding: EdgeInsets.all(10),
             child: query==""? Text("${names[i]}", style: TextStyle(fontSize: 25),):
             Text("${filternames[i]}",style: TextStyle(fontSize: 25),)
         ),
       );


       });

     //  Text("${names[i]}",style: TextStyle(fontSize: 25),));

  }

}*/






