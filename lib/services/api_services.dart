import 'dart:convert';

import 'package:employee_forums_tasks/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ApiServices extends ChangeNotifier {
  List<PostModel> posts = [];
  List<PostModel> newPosts = [];
  int _page = 1;
  bool _isLoading = false;
  bool connectivityResult = false;

  // Method to fetch initial posts
  Future<void> getInitialPosts(context) async {
    await checkConnectivity(context);
    if (connectivityResult) {
      try {
        _isLoading = true;
        final response = await http.get(Uri.parse(
            'https://post-api-omega.vercel.app/api/posts?limit=3&page=$_page'));
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          posts = (data as List).map((e) => PostModel.fromJson(e)).toList();
          _isLoading = false;
          if (posts.length <= 7) {
            await savePostsToSharedPreferences(
                posts); // Save posts to SharedPreferences
          }
        } else {
          throw Exception('Failed to load posts');
        }
      } catch (e) {
        _isLoading = false;
        throw Exception('Failed to load posts: $e');
      }
    }
    notifyListeners();
  }

  Future<void> getMorePosts() async {
    newPosts.clear();
    try {
      if (_isLoading) return; // Return if already loading
      _isLoading = true;
      _page++; // Increment page number
      final response = await http.get(Uri.parse(
          'https://post-api-omega.vercel.app/api/posts?limit=2&page=$_page'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        newPosts = (data as List).map((e) => PostModel.fromJson(e)).toList();
        posts.addAll(newPosts); // Add new posts to existing list
        _isLoading = false;

        if (posts.length <= 7) {
          await savePostsToSharedPreferences(
              posts); // Save posts to SharedPreferences
        }
      } else {
        throw Exception('Failed to load more posts');
      }
    } catch (e) {
      _isLoading = false;
      throw Exception('Failed to load more posts: $e');
    }
    notifyListeners();
  }

  Future<void> savePostsToSharedPreferences(List<PostModel> posts) async {
    final box = GetStorage();
    List<Map<String, dynamic>> postsJson =
        posts.map((post) => post.toJson()).toList();
    box.write('posts', postsJson);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // Convert each PostModel object to a JSON string
    // List<String> postsJson = posts.map((post) => json.encode(post.toJson())).toList();
    // Save the list of JSON strings to SharedPreferences
    // await prefs.setStringList('posts', postsJson);
  }

  Future<void> checkConnectivity(context) async {
    connectivityResult = await InternetConnectionChecker().hasConnection;
    if (connectivityResult == true) {
      debugPrint('got internet connection!');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('No internet connection!'),
        ),
      );
      debugPrint('No internet :(');
    }
    notifyListeners();
  }

  Future<void> likePostLocally(int index) async {
    final box = GetStorage();
    PostModel postsJson = posts[index];

    // Retrieve the existing liked list from local storage
    List<PostModel> likedPosts = (box.read('liked') ?? [])
        .map<PostModel>((json) => PostModel.fromJson(json))
        .toList();

    // Add the new liked post to the liked list
    likedPosts.add(postsJson);

    // Update the liked list in local storage
    box.write('liked', likedPosts.map((post) => post.toJson()).toList());

    notifyListeners();
  }
}
