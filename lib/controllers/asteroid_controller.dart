import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/asteroid_model.dart';

class AstDetailsController extends GetxController {
  var isLoading = false.obs;
  var getAsteroid = List<OneAsteroid>.empty(growable: true).obs;
  TextEditingController searchController = TextEditingController();
  var isVisible = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getAsteroid = Get.arguments;
    super.onInit();
  }

  changeVisible() {
    isVisible.value = true;
    update();
  }
}
