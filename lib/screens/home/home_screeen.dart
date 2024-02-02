import 'package:employee_forums_tasks/screens/home/post_component.dart';
import 'package:employee_forums_tasks/theme/app_color.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    AppColorScheme appColorScheme = AppColorScheme();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 241, 241, 241),
          leading: const Icon(Icons.menu),
          title: const Center(
              child: Text("DEMO APP", style: TextStyle(fontSize: 18))),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
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
                        // ignore: use_full_hex_values_for_flutter_colors
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
              const PostComponent(),
            ],
          ),
        ));
  }
}
