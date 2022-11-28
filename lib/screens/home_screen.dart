import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:task_api_integration/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Asteroid Details", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_list))],
      ),
      body: GetBuilder<HomeController>(
          builder: (controller) => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            onChanged: (val) {
                              if (val.length > 5) controller.changeVisible();
                            },
                            controller: controller.searchController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Search",
                                suffixIcon: controller.isVisible.value
                                    ? InkWell(
                                        onTap: () {
                                          controller.getSpecificAsteroid(
                                              controller.searchController.text);
                                        },
                                        child: Icon(Icons.search))
                                    : SizedBox()),
                          )),
                      SizedBox(
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.asteroidList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    tileColor: Colors.green[100],
                                    leading: Text(
                                        "Id : " +
                                            controller.asteroidList[index].id
                                                .toString(),
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    title: Text(
                                        "Name : " +
                                            controller
                                                .asteroidList[index].name!,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    subtitle: Text(
                                        "Name Code : " +
                                            controller.asteroidList[index]
                                                .designation!,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    trailing: Text(
                                        "Magnitude : " +
                                            controller
                                                .asteroidList[index].magnitude!,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                );
                              })),
                    ],
                  ),
                )),
    );
  }
}
