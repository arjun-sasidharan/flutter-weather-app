import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './home/presentation/home_page.dart';

// TODO: For dev environment only, must comment out in production
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  // TODO: For dev environment only, must comment out in production
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Assignment 4',
      getPages: [
        GetPage(name: '/home', page: () => HomePage()),
      ],
      initialRoute: '/home',
      theme: ThemeData(primarySwatch: Colors.grey, fontFamily: 'Quicksand'),
    );
  }
}
