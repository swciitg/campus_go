import 'package:campus_go/globals/my_colors.dart';
import 'package:campus_go/globals/my_fonts.dart';
import 'package:campus_go/widgets/outlet/menu_tile.dart';
import 'package:flutter/material.dart';

class MenuTab extends StatefulWidget {
  const MenuTab({super.key});

  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),child: SingleChildScrollView(
      child: Column(children: [
        Container(
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(
                    children: [
                    Icon(Icons.menu_book_outlined, color: kBlack, size:22 ,),
                    SizedBox(width: 8,),
                    Text("Explore Menu", style: MyFonts.w600.setColor(kBlack).size(18),)

                  ],),
                  Text("Click \"ADD\" for adding to cart", style: MyFonts.w300.setColor(kBlack).size(10),),
                ]),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text("2"+" Items Added", style: MyFonts.w500.setColor(kBlack).size(12),),
              )
            ],
          ),
        ),
        SizedBox(height: 8,),
        MenuTile(veg: true,isAdded: true,),
        MenuTile(veg: false,isAdded: false,),
      ]),
    ),);
  }
}