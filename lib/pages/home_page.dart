import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String id = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: GestureDetector(child: Text("HomePage"),onTap: () {
      Navigator.of(context).pushNamed('/ps');
    },),);
  }
}