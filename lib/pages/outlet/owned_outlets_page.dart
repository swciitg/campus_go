import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/models/admin_model.dart';
import 'package:campus_go/pages/home/home_page.dart';
import 'package:flutter/material.dart';

import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import '../../widgets/ui/appbar.dart';

class OwnedOutletsPage extends StatefulWidget {
  final AdminModel adminModel;
  const OwnedOutletsPage({super.key, required this.adminModel});

  @override
  State<OwnedOutletsPage> createState() => _OwnedOutletsPageState();
}

class _OwnedOutletsPageState extends State<OwnedOutletsPage> {
  int selectedOutlet = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Choose Outlet",
          displayProfileIcon: false, displayBackButton: false),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: SizedBox(
          height: 56,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: (() {
                // onFormSubmit();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                              outletModel: outletModels['a'],
                            )),
                    (route) => false);
              }),
              style: ElevatedButton.styleFrom(
                  backgroundColor: lBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Text(
                "Proceed",
                style: MyFonts.w400.setColor(kButtonText).size(18),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Center(
              child: ListView.builder(
                  itemCount: widget.adminModel.outletsOwned.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Align(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOutlet = index;
                            });
                          },
                          child: Container(
                            height: 64,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: selectedOutlet == index
                                    ? Border.all(color: lBlue, width: 2)
                                    : null,
                                color: kAppBarGrey,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              widget.adminModel.outletsOwned[index],
                              style: MyFonts.w500.setColor(selectedOutlet == index?lBlue:kWhite).size(24),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
