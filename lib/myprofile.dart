// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset("images/1.png"),
            Center(
              child: Container(
                height: 150,
                width: 150,
                margin: EdgeInsets.only(top: 150),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 120,
                  child: CircleAvatar(
                    radius: 110,
                    backgroundImage: AssetImage('images/2.png'),
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          height: 30,
          width: double.infinity,
          child: Text(
            "Noore Sadon",
            style: TextStyle(fontSize: 25),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            alignment: Alignment.center,
            // margin: EdgeInsets.only(right: 30),
            width: 350,
            height: double.infinity,
            child: Text(
              "Welcome to my store  ",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 17),
            )),
        // Container(
        //     child: Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   // ignore: prefer_const_literals_to_create_immutables
        //   children: [

        //     Divider(
        //       height: 20,
        //       thickness: 3,
        //       color: Colors.blueGrey,
        //     ),
        //     Container(
        //         margin: EdgeInsets.only(right: 40),
        //         width: 340,
        //         height: 30,
        //         child: Text(
        //           "Address:",
        //           textAlign: TextAlign.left,
        //           style: TextStyle(fontSize: 17),
        //         )),
        //     Divider(
        //       height: 20,
        //       thickness: 3,
        //       color: Colors.blueGrey,
        //     ),
        //     Container(
        //         margin: EdgeInsets.only(right: 50),
        //         width: 330,
        //         height: 30,
        //         child: Text(
        //           "Joined in:",
        //           textAlign: TextAlign.left,
        //           style: TextStyle(fontSize: 17),
        //         )),
        //     Divider(
        //       height: 20,
        //       thickness: 3,
        //       color: Colors.blueGrey,
        //     ),
        //     Container(
        //         margin: EdgeInsets.only(right: 60),
        //         width: 320,
        //         height: 30,
        //         child: Text(
        //           "Numbers:",
        //           textAlign: TextAlign.left,
        //           style: TextStyle(fontSize: 17),
        //         )),
        //     Divider(
        //       height: 20,
        //       thickness: 3,
        //       color: Colors.blueGrey,
        //     ),
        //     Container(
        //         margin: EdgeInsets.only(right: 70),
        //         width: 310,
        //         height: 30,
        //         child: Text(
        //           "Contacts:",
        //           textAlign: TextAlign.left,
        //           style: TextStyle(fontSize: 17),
        //         )),
        //     Divider(
        //       height: 20,
        //       thickness: 3,
        //       color: Colors.blueGrey,
        //     ),
        //   ],
        // )),
      ],
    );
  }
}
