import 'dart:convert';

import 'package:employee_forums_tasks/models/post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<PostModel> getPosts() async {
    final response = await http
        .get(Uri.parse('https://post-api-omega.vercel.app/api/posts?page=2'));
    if (response.statusCode == 200) {
      return PostModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
