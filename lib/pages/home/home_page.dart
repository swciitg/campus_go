import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/pages/home/admin_home_tab.dart';
import 'package:campus_go/stores/user_store.dart';
import 'package:campus_go/widgets/ui/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import '../orders/orders_tab.dart';
import 'user_home_tab.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  static String id = "/home";
  int? index;
  HomePage({super.key, this.index});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.index != null) {
      index = widget.index!;
      widget.index=null;
    }
    var userStore = context.read<UserStore>();
    final tabs = [
      userStore.viewType == ViewType.admin
          ? const AdminHomeTab()
          : const UserHomeTab(),
      const OrdersTab(),
    ];
    
    return Observer(
      builder: (context) => Scaffold(
        appBar: appBar(context, "CampusGO"),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: kWhite,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              labelTextStyle: MaterialStateProperty.all(
                  MyFonts.w500.setColor(kWhite).size(12)),
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
          child: tabs[index],
        ),
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
