import 'dart:convert';

import 'package:dio/dio.dart';

class ApiMapper {
  static List<T> mapList<T>(
      Response response, T Function(Map<String, dynamic> json) map) {
    final List<dynamic> list = response.data;
    return list.map((e) => map(e)).toList();
  }

  static T map<T>(
      Response response, T Function(Map<String, dynamic> json) map) {
    return map(response.data);
  }
}
