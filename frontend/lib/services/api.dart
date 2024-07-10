import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://192.168.29.18:3000/api/";
  static addStudent(Map data) async {
    print(data);
    var url = Uri.parse(baseUrl + "addStudent");
    try {
      final res = await http.post(url, body: data);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());

        print(data);
      } else {
        print("Failed to upload data");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
