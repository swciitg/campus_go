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
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            labelTextStyle: MaterialStateProperty.all(
                MyFonts.w500.setColor(kWhite).size(12)),
            iconTheme:
                MaterialStateProperty.all(const IconThemeData(color: kWhite))),
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
        child: tabs[index],
      ),
    );
  }
}

List<Widget> bottomNavIcons() {
  return [
    const NavigationDestination(
      icon: Icon(Icons.store_mall_directory_outlined),
      label: 'Home',
      selectedIcon: Icon(
        Icons.store_mall_directory_outlined,
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
