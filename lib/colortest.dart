import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/lory/ProductDetail_controller.dart';

class ColorTest extends StatefulWidget {
  const ColorTest({super.key});

  @override
  State<ColorTest> createState() => _ColorTestState();
}

int? index=1;
List<dynamic> Colors = [];

class _ColorTestState extends State<ColorTest> {
  @override
  Widget build(BuildContext context) {
    ProductDetailController controller = Get.put(ProductDetailController());
    controller.getprobyid(index!);
    Colors.add(controller.colors);
    print(Colors);
    return GetBuilder<ProductDetailController>(
      builder: (controller) => Scaffold(
        body: Row(
          children: [Container()],
        ),
      ),
    );
  }
}
