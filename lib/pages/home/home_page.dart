import 'package:campus_go/widgets/ui/appbar.dart';
import 'package:flutter/material.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import '../orders/orders_tab.dart';
import 'home_tab.dart';

class HomePage extends StatefulWidget {
  static String id = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  int index = 0;
  final tabs = [
    const HomeTab(),
    const OrdersTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "CampusGO"),
      bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
                indicatorColor: kWhite,
                labelTextStyle:
                    MaterialStateProperty.all(MyFonts.w500.setColor(kWhite)),
                iconTheme: MaterialStateProperty.all(
                    const IconThemeData(color: kWhite))),
            child: NavigationBar(
              backgroundColor: kBlack,
              selectedIndex: index,
              onDestinationSelected: (index) => setState(() {
                this.index = index;

              }),
              destinations: bottomNavIcons(),
            ),
          ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                        text: 'Out',
                        style: TextStyle(
                            fontFamily: "Poppins",
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: kBlack,
                            fontWeight: FontWeight.w500)),
                    TextSpan(
                        text:
                            "lets Available",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            color: kBlack,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              SizedBox(height: 24,),
              tabs[index],
      
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> bottomNavIcons() {
  return [
    const NavigationDestination(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
      selectedIcon: Icon(
        Icons.home_outlined,
        color: kBlack,
      ),
    ),
    const NavigationDestination(
      icon: Icon(Icons.shopping_bag_outlined),
      label: 'Orders',
      selectedIcon: Icon(
       Icons.shopping_bag_outlined,
        color: kBlack,
      ),
    ),
  ];
}