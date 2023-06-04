import 'package:campus_go/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'globals/my_colors.dart';
import 'routes.dart';

void main() {
  runApp( const MyApp());
}
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kWhite,
        splashColor: Colors.transparent,
      ),
      title: 'CampusGO',
      routes: routes,
      home: const LoginPage(),
    );
  }
}
