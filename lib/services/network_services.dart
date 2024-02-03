// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';

// class CheckConnectivity {
//   Future<bool> checkNetworkConnectivity() async {
//     try {
//       late StreamSubscription _connectivitySubscription;
//       _connectivitySubscription = Connectivity()
//           .onConnectivityChanged
//           .listen((ConnectivityResult result) {
//         print('Connectivity changed: $result');
//       });
//       ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
//       print(connectivityResult);
//       if (connectivityResult == ConnectivityResult.none) {
//         return false; // No network connection
//       } else {
//         return true; // Network connection is available
//       }
//     } catch (e) {
//       print('Error checking network connectivity: $e');
//       return false; // Assume no network connection in case of errors
//     }
//   }
// }
