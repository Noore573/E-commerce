import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/lory/DeleteUsersScreen.dart';
import 'package:project2/lory/DeleteProduct.dart';
import 'package:project2/lory/ReviewReports.dart';
//import '../../Constant.dart';
// import'package:untitled4/modules/Me/Me_controller.dart';
// import 'package:untitled4/components/custom_button.dart';

// import '../DeleteProduct/DeleteProduct.dart';
// import '../DeleteUsersScreen/DeleteUsersScreen.dart';
/*class Me extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
   child: Column(

              children: [
                SizedBox(height: 20,),
                Center(
                  child: CircleAvatar(
                    radius: 50.0, // set the radius to half of the image's width or height
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),),
                 SizedBox(height: 10,),
                Container(
                  child: Text(
                    "Sam Smith",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text("Flutter  Developer",style:TextStyle(color: Colors.black87,fontSize: 20)),
                SizedBox(height: 20,),

          Card(
            color: Colors.grey.shade200,
            child: const ListTile(
              leading: Icon(Icons.location_on_outlined,color: Colors.black,),
              title: Text('Address'),
              subtitle: Text('Damascus-Syria'),
            )),
                const Divider(),
                Card(
                  color: Colors.grey.shade200,
                  child: const ListTile(
                    leading: Icon(Icons.email_outlined,color: Colors.black,),
                    title: Text('Email'),
                    subtitle: Text('SamSmith@gmail.com'),
                  ),
                ),
                const Divider(),
                Card(
                  color: Colors.grey.shade200,
                  child: const ListTile(
                    leading: Icon(Icons.phone,color: Colors.black,),
                    title: Text('Phone'),
                    subtitle: Text('+963-955144810'),
                  ),
                ),

              ],
            ),

          ),



            );

  }
}*/

class Me extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Actions',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ActionCard(
                    title: 'Delete Users',
                    icon: Icons.delete,
                    onTap: () {
                      // Perform delete users action
                      Get.to(() => DeleteUsersScreen(), arguments: {
                        'userIds': [1, 2, 3]
                      });
                    },
                    key: UniqueKey(),
                  ),
                  ActionCard(
                    title: 'Delete Products',
                    icon: Icons.delete,
                    onTap: () {
                      // Perform delete products action
                      Get.to(() => DeleteProduct());
                    },
                    key: UniqueKey(),
                  ),
                  ActionCard(
                    title: 'Review Reports',
                    icon: Icons.report,
                    onTap: () {
                      Get.to(() => ReviewReports());
                      // Perform review reports action
                    },
                    key: UniqueKey(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Orders (Last 15 Days)',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return OrderCard(
                    key: UniqueKey(),
                    orderNumber: '000${15 - index}',
                    date: DateTime.now().subtract(Duration(days: index)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ActionCard({
    required Key key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(icon),
              SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderNumber;
  final DateTime date;

  const OrderCard({
    required Key key,
    required this.orderNumber,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Order #$orderNumber',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '${date.day}/${date.month}/${date.year}',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*   child: Container(
                      height:MediaQuery.of(context).size.height,
                      width:MediaQuery.of(context).size.width,
                      decoration: gardientBackground,
                      child:
                      ListView(
                          children: [
                            Container(height: 20,),
                            Center(
                              child: CircleAvatar(
                                child: Icon(Icons.person_rounded,size: 40,color: Colors.grey,),
                                radius: 50,
                                backgroundColor: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Center(child: Text("Sami Razouk",style: TextStyle(fontSize: 20,color: Colors.white),)),
                            Container(height: 40,),
                            Container(
                              padding:EdgeInsets.all(10) ,
                              width:  30,//MediaQuery.of(context).size.width*0.9,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white.withAlpha(20),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border(
                                    top: BorderSide(width: 2,color:Colors.white),
                                    bottom: BorderSide(width: 2,color:Colors.white),
                                    left: BorderSide(width: 2,color:Colors.white),
                                    right: BorderSide(width: 2,color:Colors.white),

                                  ),

                              ),
                              child: Center(
                                child: TextField(
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 20),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "USER NAME",
                                    hintStyle: TextStyle(color: Colors.white,
                                        fontSize: 20),
                                    contentPadding: EdgeInsets.all(10),
                                  ),

                                ),
                              ),),
                            Container(height: 10,),
                            Container(
                              padding:EdgeInsets.all(10) ,
                              width:  30,//MediaQuery.of(context).size.width*0.9,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white.withAlpha(20),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border(
                                    top: BorderSide(width: 2,color:Colors.white),
                                    bottom: BorderSide(width: 2,color:Colors.white),
                                    left: BorderSide(width: 2,color:Colors.white),
                                    right: BorderSide(width: 2,color:Colors.white),

                                  )
                              ),
                              child: Center(
                                child:
                                    TextField(
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(color: Colors.black,
                                          fontSize: 20),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "EMAIL OR PHONE NUMBER",
                                        hintStyle: TextStyle(color: Colors.white,
                                            fontSize: 20),
                                        contentPadding: EdgeInsets.all(10),
                                      ),

                                    ),

                                ),
                              ),
                            Container(height: 10,),
                            Container(
                              padding:EdgeInsets.all(10) ,
                              width:  30,//MediaQuery.of(context).size.width*0.9,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white.withAlpha(20),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border(
                                    top: BorderSide(width: 2,color:Colors.white),
                                    bottom: BorderSide(width: 2,color:Colors.white),
                                    left: BorderSide(width: 2,color:Colors.white),
                                    right: BorderSide(width: 2,color:Colors.white),

                                  )
                              ),
                              child: Center(
                                child: TextField(
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 20),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "ADDRESS",
                                    hintStyle: TextStyle(color: Colors.white,
                                        fontSize: 20),
                                    contentPadding: EdgeInsets.all(10),
                                  ),

                                ),
                              ),),
                            Container(height: 10,),
                            Container(
                              padding:EdgeInsets.all(10) ,
                              width:  30,//MediaQuery.of(context).size.width*0.9,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white.withAlpha(20),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border(
                                    top: BorderSide(width: 2,color:Colors.white),
                                    bottom: BorderSide(width: 2,color:Colors.white),
                                    left: BorderSide(width: 2,color:Colors.white),
                                    right: BorderSide(width: 2,color:Colors.white),

                                  )
                              ),
                              child: Center(
                                child: TextField(
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 20),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "PASSWORD",
                                    hintStyle: TextStyle(color: Colors.white,
                                        fontSize: 20),
                                    contentPadding: EdgeInsets.all(10),
                                  ),

                                ),
                              ),),
                            Container(height: 10,),
                            Container(
                              padding:EdgeInsets.all(10) ,
                              width:  30,//MediaQuery.of(context).size.width*0.9,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white.withAlpha(20),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border(
                                    top: BorderSide(width: 2,color:Colors.white),
                                    bottom: BorderSide(width: 2,color:Colors.white),
                                    left: BorderSide(width: 2,color:Colors.white),
                                    right: BorderSide(width: 2,color:Colors.white),

                                  )
                              ),
                              child: Center(
                                child: TextField(
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 20),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "CONFRIM PASSWORD ",
                                    hintStyle: TextStyle(color: Colors.white,
                                        fontSize: 20),
                                    contentPadding: EdgeInsets.all(10),
                                  ),

                                ),
                              ),),
                            Container(height: 10,),
                            CustomButton(width: 300,
                              height: 40,
                              buttonName: 'sign_up',
                              onTap: (){onClickRegister();},),
                            SizedBox(

                                height:20,child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(onPressed:(){print("tap");}, icon:Icon(Icons.shop)),
                                IconButton(onPressed:(){print("tap");}, icon:Icon(Icons.account_balance_wallet_sharp)),
                                IconButton(onPressed:(){print("tap");}, icon:Icon(Icons.add_call)),
                                IconButton(onPressed:(){print("tap");}, icon:Icon(Icons.account_box_rounded)),

                              ],
                            )

                            ),

                          ]
                      ),

                    )*/
/*   child: Column(

              children: [
                SizedBox(height: 20,),
                Center(
                  child: CircleAvatar(
                    radius: 50.0, // set the radius to half of the image's width or height
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),),
                 SizedBox(height: 10,),
                Container(
                  child: Text(
                    "Sam Smith",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text("Flutter  Developer",style:TextStyle(color: Colors.black87,fontSize: 20)),
                SizedBox(height: 20,),

          Card(
            color: Colors.grey.shade200,
            child: const ListTile(
              leading: Icon(Icons.location_on_outlined,color: Colors.black,),
              title: Text('Address'),
              subtitle: Text('Damascus-Syria'),
            )),
                const Divider(),
                Card(
                  color: Colors.grey.shade200,
                  child: const ListTile(
                    leading: Icon(Icons.email_outlined,color: Colors.black,),
                    title: Text('Email'),
                    subtitle: Text('SamSmith@gmail.com'),
                  ),
                ),
                const Divider(),
                Card(
                  color: Colors.grey.shade200,
                  child: const ListTile(
                    leading: Icon(Icons.phone,color: Colors.black,),
                    title: Text('Phone'),
                    subtitle: Text('+963-955144810'),
                  ),
                ),

              ],
            ),*/
/*void onClickRegister(){
  var controller;
  controller.registerOnClick((Get.toNamed("/first")));
}*/