import 'package:employee_forums_tasks/models/post_model.dart';
import 'package:employee_forums_tasks/screens/home/post_component.dart';
import 'package:employee_forums_tasks/theme/app_color.dart';
import 'package:employee_forums_tasks/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:employee_forums_tasks/services/api_services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late ApiServices _apiServices;
  final FontThemeClass fontThemeClass = FontThemeClass();
  final AppColorScheme appColorScheme = AppColorScheme();
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _apiServices = Provider.of<ApiServices>(context, listen: false);
    _apiServices.getInitialPosts(context);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // User has reached the bottom of the list
      _apiServices.getMorePosts(); // Fetch more posts
    }
  }

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    List<dynamic> postsJson = box.read('posts') ?? [];
    List<PostModel> posts =
        postsJson.map((postJson) => PostModel.fromJson(postJson)).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        leading: const Icon(Icons.menu),
        title: const Center(
            child: Text("DEMO APP", style: TextStyle(fontSize: 18))),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () async {},
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 300,
                height: 44,
                margin: const EdgeInsets.symmetric(vertical: 12.5),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    filled: true,
                    fillColor: appColorScheme.lightBlue,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2000.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'search for posts ...',
                    hintStyle: TextStyle(color: appColorScheme.primaryGrey),
                  ),
                ),
              ),
              Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Image(image: AssetImage("assets/filter.png")),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.68,
            child: Consumer<ApiServices>(
              builder: (context, apiServices, _) {
                return apiServices.connectivityResult
                    ? ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: apiServices.posts.length + 1,
                        itemBuilder: (context, index) {
                          if (index < apiServices.posts.length) {
                            return PostComponent(index: index);
                          } else {
                            return const Center(
                              child: LinearProgressIndicator(),
                            );
                          }
                        },
                      )
                    : (apiServices.connectivityResult == false && posts != [])
                        ? ListView.builder(
                            shrinkWrap: true,
                            controller: _scrollController,
                            itemCount: posts.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Divider(
                                    color: appColorScheme.primaryGrey,
                                    height: 10,
                                    thickness: 7,
                                    indent: 0,
                                    endIndent: 0,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      const ClipOval(
                                        child: Icon(
                                          Icons.person,
                                          size: 36.5,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            child: Text(
                                              posts[index].title!,
                                              style:
                                                  fontThemeClass.small(context),
                                            ),
                                          ),
                                          Text(
                                            posts[index].eventCategory!,
                                            style: fontThemeClass.tiny(context),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.more_horiz))
                                    ],
                                  ),
                                  Container(
                                      height: 336,
                                      width: double.infinity,
                                      color: appColorScheme.primaryGrey,
                                      child: const Icon(Icons.image)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        posts[index].description!,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 18,
                                          ),
                                          const SizedBox(
                                            width: 16,
                                            child: Image(
                                                image: AssetImage(
                                                    "assets/thumbs.png")),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${posts[index].likes} Likes",
                                            style:
                                                fontThemeClass.normal(context),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 16,
                                            child: Image(
                                                image: AssetImage(
                                                    "assets/comment.png")),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${posts[index]
                                                    .noOfComments} Comments",
                                            style:
                                                fontThemeClass.normal(context),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 16,
                                            child: Image(
                                                image: AssetImage(
                                                    "assets/share.png")),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Share",
                                            style:
                                                fontThemeClass.normal(context),
                                          ),
                                          const SizedBox(
                                            width: 18,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            })
                        : const Center(
                            child: Text(
                                "connect to the internet to load offline content"),
                          );
              },
            ),
          ),
        ],
      ),
    );
  }
}
