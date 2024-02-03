// import 'package:employee_forums_tasks/main.dart';
// import 'package:employee_forums_tasks/services/api_services.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     await Provider.of<ApiServices>(context, listen: false).getPosts();
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const BottomNavigationBarExample()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }