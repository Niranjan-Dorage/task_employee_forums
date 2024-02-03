import 'package:employee_forums_tasks/services/api_services.dart';
import 'package:employee_forums_tasks/theme/app_color.dart';
import 'package:employee_forums_tasks/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostComponent extends StatefulWidget {
  final int index;
  const PostComponent({Key? key, required this.index}) : super(key: key);

  @override
  State<PostComponent> createState() => _PostComponentState();
}

class _PostComponentState extends State<PostComponent> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    AppColorScheme appColorScheme = AppColorScheme();
    FontThemeClass fontThemeClass = FontThemeClass();
    final postProvider = Provider.of<ApiServices>(context); // Change here
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
            ClipOval(
              child: Image(
                image: NetworkImage(postProvider.posts[widget.index].image![0]),
                width: 36.5,
                height: 36.5,
                fit: BoxFit.cover,
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
                    postProvider.posts[widget.index].title!,
                    style: fontThemeClass.small(context),
                  ),
                ),
                Text(
                  postProvider.posts[widget.index].eventCategory!,
                  style: fontThemeClass.tiny(context),
                ),
              ],
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
          ],
        ),
        Container(
          height: 336,
          width: double.infinity,
          color: appColorScheme.primaryGrey,
          child: Image(
            image: NetworkImage(postProvider.posts[widget.index].image![0]),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              postProvider.posts[widget.index].description!,
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
            InkWell(
              onTap: () {
                   setState(() {
                          if (liked == false) {
                            postProvider.likePostLocally(widget.index);
                          }
                          liked = true; //
                        });
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 18,
                  ),
                  SizedBox(
                      width: 16,
                      height: 22,
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                       
                        },
                        icon: Icon(
                          Icons.thumb_up_alt_outlined,
                          size: 20,
                          color: liked == true ? Colors.blue : Colors.grey,
                        ),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${postProvider.posts[widget.index].likes} Likes",
                    style: fontThemeClass.normal(context),
                  )
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                  child: Image(image: AssetImage("assets/comment.png")),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "${postProvider.posts[widget.index].noOfComments} Comments",
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
  }
}
