import 'package:flutter/material.dart';

import '../../globals/my_colors.dart';

class AdminHomeTab extends StatefulWidget {
  const AdminHomeTab({super.key});

  @override
  State<AdminHomeTab> createState() => _AdminHomeTabState();
}

class _AdminHomeTabState extends State<AdminHomeTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: 'Admin ',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          // decoration: TextDecoration.underline,
                          // decorationThickness: 2,
                          fontSize: 18,
                          color: kBlack,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: "Home Page",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          color: kBlack,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
          // SizedBox(height: 3,),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Container(
              height: 2,
              width: 30,
              color: kBlack,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}