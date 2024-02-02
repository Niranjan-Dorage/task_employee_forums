import 'package:employee_forums_tasks/theme/app_color.dart';
import 'package:employee_forums_tasks/theme/app_font.dart';
import 'package:flutter/material.dart';

class PostComponent extends StatelessWidget {
  const PostComponent({super.key});

  @override
  Widget build(BuildContext context) {
    AppColorScheme appColorScheme = AppColorScheme();
    FontThemeClass fontThemeClass = FontThemeClass();
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
            SizedBox(
              width: 12,
            ),
            ClipOval(
                child: Image(
              image: NetworkImage(
                  "https://s3-alpha-sig.figma.com/img/a57f/7188/c5c7aa2da965020d4f85fee632bb0bc2?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=KgGwfgNpsAAq10JeXLepe~S8QMkIZGfN23ewGU-N9TNGi3NeQ8lVxQQRq2Z7k0i05YODMda9Bf0y8p2ThAl9iT2MYVcY6u3cd1AxRLJdmiKqshrtgK7hwK9uKug8OsRzhTC0v2F4nA2vjrBtTF5D4R-jPPHWe6EpnfMGD4D4hBVCHbEvyHll8vUQRteohwg9fLMlhjS7wC~sW-NT-J25nvXreNedQJZ3idixuB~jsBz0kIVDhpZx~WRWSf6KyciSLosrAfDPfdrE8ru2aAVuoQYxZvAS1KPfy1Z-xBw6oXQVjBWJcNctMsr4j-BHPRtvf7bh46nyXQJaY0cyPjaCIQ__"),
              width: 36.5,
              height: 36.5,
              fit: BoxFit.cover,
            )),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  child: Text(
                    "name name",
                    style: fontThemeClass.small(context),
                  ),
                ),
                Text(
                  "name",
                  style: fontThemeClass.tiny(context),
                ),
              ],
            ),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
          ],
        ),
        Container(
          height: 336,
          width: double.infinity,
          color: appColorScheme.primaryGrey,
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: const Text(
            "we need to start with the basics. A fundamental under of blogging will help",
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 18,
                ),
                Container(
                    width: 16,
                    child: Image(image: AssetImage("assets/thumbs.png"))),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "5k Like",
                  style: fontThemeClass.normal(context),
                )
              ],
            ),
            Row(
              children: [
                Container(
                    width: 16,
                    child: Image(image: AssetImage("assets/comment.png"))),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "45 Comments",
                  style: fontThemeClass.normal(context),
                )
              ],
            ),
            Row(
              children: [
                Container(
                    width: 16,
                    child: Image(image: AssetImage("assets/share.png"))),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Share",
                  style: fontThemeClass.normal(context),
                ),
                SizedBox(
                  width: 18,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
