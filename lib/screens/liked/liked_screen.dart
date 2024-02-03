import 'package:employee_forums_tasks/services/api_services.dart';
import 'package:employee_forums_tasks/theme/app_color.dart';
import 'package:employee_forums_tasks/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/post_model.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late ApiServices _apiServices;
    final FontThemeClass fontThemeClass = FontThemeClass();
    final AppColorScheme appColorScheme = AppColorScheme();
    final box = GetStorage();
    List<dynamic> likedJson = box.read('liked') ?? [];
    List<PostModel> likedPosts =
        likedJson.map((postJson) => PostModel.fromJson(postJson)).toList();
    return (likedJson.isNotEmpty)
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: likedPosts.length,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            child: Text(
                              likedPosts[index].title!,
                              style: fontThemeClass.small(context),
                            ),
                          ),
                          Text(
                            likedPosts[index].eventCategory!,
                            style: fontThemeClass.tiny(context),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.more_horiz))
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
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        likedPosts[index].description!,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 18,
                          ),
                          const SizedBox(
                            width: 16,
                            child:
                                Image(image: AssetImage("assets/thumbs.png")),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${likedPosts[index].likes} Likes",
                            style: fontThemeClass.normal(context),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 16,
                            child:
                                Image(image: AssetImage("assets/comment.png")),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${likedPosts[index].noOfComments} Comments",
                            style: fontThemeClass.normal(context),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 16,
                            child: Image(image: AssetImage("assets/share.png")),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Share",
                            style: fontThemeClass.normal(context),
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
            child: Text("connect to the internet to load offline content"),
          );
  }
}
