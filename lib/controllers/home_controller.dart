import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_api_integration/Services/api_services.dart';
import 'package:task_api_integration/constants.dart';

import '../models/asteroid_model.dart';
import '../screens/asteroid_details.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var asteroidList = List<Asteroid>.empty(growable: true).obs;
  var getAsteroid = List<OneAsteroid>.empty(growable: true).obs;
  TextEditingController searchController = TextEditingController();
  var isVisible = false.obs;
  int? id;
  String? name;
  String? designation;
  String? magnitude;

  @override
  void onInit() {
    // TODO: implement onInit
    getAllData();
    super.onInit();
  }

  changeVisible() {
    isVisible.value = true;
    update();
  }

  void getAllData() async {
    isLoading.value = true;
    await ApiService()
        .getApi(urlGetAll)
        .then((value) => {
              value['near_earth_objects'].forEach((element) {
                asteroidList.add(Asteroid(
                    id: int.parse(element['id']),
                    name: element['name'],
                    designation: element['designation'],
                    magnitude: element['absolute_magnitude_h'].toString()));
              }),
              // id = value['near_earth_objects'][0]['id'],
              // name = value['near_earth_objects'][0]['name'],
              // designation = value['near_earth_objects'][0]['id'],
              // magnitude = value['near_earth_objects'][0]['id'],

              print("GET ALL RESPONSE ${value.toString()}")
            })
        .catchError((onError) {
      Get.snackbar("Oops", "Something went wrong... Try again");
      throw onError;
    });
    isLoading.value = false;
    update();
  }

  void getSpecificAsteroid(id) async {
    isLoading.value = true;
    await ApiService()
        .getApi(urlGetSpecific(id))
        .then((value) => {
              print(value.toString()),

              getAsteroid.add(OneAsteroid(
                  id: int.parse(value['id']),
                  name: value['name'],
                  designation: value['designation'],
                  magnitude: value['absolute_magnitude_h'].toString(),
                  url: value['nasa_jpl_url'])),
              // id = value['near_earth_objects'][0]['id'],
              // name = value['near_earth_objects'][0]['name'],
              // designation = value['near_earth_objects'][0]['id'],
              // magnitude = value['near_earth_objects'][0]['id'],
              Get.to(() => AsteroidDetailsPage(), arguments: getAsteroid[0]),

              print("GET ALL RESPONSE ${value.toString()}")
            })
        .catchError((onError) {
      Get.snackbar("Oops", "Something went wrong... Try again");
      throw onError;
    });
    isLoading.value = false;
    update();
  }
}
