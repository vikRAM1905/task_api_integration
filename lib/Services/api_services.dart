import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };
  Future getApi(url) async {
    dynamic data;
    var baseUrl = Uri.parse(url);
    await http.get(baseUrl, headers: headers).then((response) {
      if (response.statusCode == 200) {
        data = json.decode(response.body.toString());
        print("Response /////// ${data.toString()}");
      } else {
        print("api error");
        throw Error();
      }
    });
    return data;
  }
}
