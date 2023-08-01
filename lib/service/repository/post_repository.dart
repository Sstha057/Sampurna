import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../model/posts_model.dart';
import 'api/api.dart';

Dio dio = Dio();

class ApiServices {
  static Future<List<PostsModel>> postRepository() async {
    Response res = await dio.get(postsApi);
    try {
      List<dynamic> list = res.data;
      return list.map((e) => PostsModel.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
