import 'package:employee_forums_tasks/screens/community/community_screen.dart';
import 'package:employee_forums_tasks/screens/home/home_screeen.dart';
import 'package:employee_forums_tasks/screens/liked/liked_screen.dart';
import 'package:employee_forums_tasks/screens/saved/saved_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const BottomNavigationBarExample(),
        // '/categories': (context) => const Categories()
      },
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Homescreen(),
    LikedScreen(),
    CommunityScreen(),
    SavedScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.red),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: const Color.fromARGB(255, 33, 33, 33),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.red,
              elevation: 0,
              unselectedItemColor: const Color.fromARGB(255, 191, 219, 234),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Liked',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Community',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark),
                  label: 'Saved',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: const Color.fromARGB(255, 32, 133, 249),
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
