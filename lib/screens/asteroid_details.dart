import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:task_api_integration/controllers/home_controller.dart';

import '../controllers/asteroid_controller.dart';

class AsteroidDetailsPage extends StatelessWidget {
  AsteroidDetailsPage({super.key});
  final astController = Get.put(AstDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: GetBuilder<AstDetailsController>(
            builder: (controller) => controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(children: [
                    Text("Id : " + controller.getAsteroid[0].id.toString(),
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("Name : " + controller.getAsteroid[0].name!,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "Name Code : " + controller.getAsteroid[0].designation!,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("Magnitude : " + controller.getAsteroid[0].magnitude!,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("url : " + controller.getAsteroid[0].magnitude!,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ]))));
  }
}
