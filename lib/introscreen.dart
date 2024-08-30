import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Login.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  double oblevel = 1.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                "images/02cec44627918d4a756d87e3976c7f89.jpg"),
            fit: BoxFit.fill),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                  setState(
                    () => oblevel = oblevel == 0 ? 1.0 : 0.0,
                  );
                
              },
              child: AnimatedOpacity(
                opacity: oblevel,
                duration: Duration(seconds: 2),
                curve: Curves.bounceOut,
                onEnd: () {
                  Get.to(() => Login());
                },
                child: Container(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      'images/logo.png',
                    )),
              ),
            ),
          
              //    Container(
              //     width: 100,
              //     height: 50,
              //     //color: Color.fromARGB(255, 232, 226, 226),
              //     decoration: BoxDecoration(
              //     color: Color.fromARGB(255, 186, 12, 0),
              //    // borderRadius: BorderRadius.circular(20),
              //     ),
              //     child:   ElevatedButton(
              //  style: ButtonStyle() ,
              //   onPressed: () {
              //     setState(
              //       () => oblevel = oblevel == 0 ? 1.0 : 0.0,
              //     );
              //   },
              //   child: Text("login"),
              //   ),),
          ],
        ),
      ),
    );
  }
}
