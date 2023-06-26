import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/models/item_model.dart';
import 'package:campus_go/widgets/ui/appbar.dart';
import 'package:flutter/material.dart';

import '../../functions/utility/validator.dart';
import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import '../../widgets/common/custom_text_field.dart';

class EditItemPage extends StatefulWidget {
  final ItemModel? itemModel;
  const EditItemPage({super.key, this.itemModel});

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  int selectedRadio = 0;

  @override
  void initState() {
    super.initState();
    if(widget.itemModel!=null){
      _nameController.text=widget.itemModel!.name;
      _priceController.text=widget.itemModel!.price;
      if(widget.itemModel!.category==FoodCategories.veg.category){
        selectedRadio=0;
      }
      else{
        selectedRadio=1;
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: appBar(context, "Edit Item",
            displayBackButton: true,
            displayProfileIcon: false,
            displayLogoutButton: false),
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

                }),
                style: ElevatedButton.styleFrom(
                    backgroundColor: kBlack,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Text(
                  "Confirm Item",
                  style: MyFonts.w400.setColor(kWhite).size(18),
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Form(
                    key: _formKey,
                    child: Column(children: [
                      CustomTextField(
                        hintText: "Item Name",
                        isNecessary: true,
                        controller: _nameController,
                        isEnabled: true,
                        inputType: TextInputType.text,
                        validator: validateField,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        hintText: "Price",
                        isNecessary: true,
                        controller: _priceController,
                        isEnabled: true,
                        inputType: TextInputType.number,
                        validator: validateField,
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ])),
                Text(
                  "Select Item Type",
                  style: MyFonts.w500.setColor(kBlack).size(16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedRadio = 0;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: Radio(
                            value: 0,
                            groupValue: selectedRadio,
                            onChanged: (val) {
                              setState(() {
                                selectedRadio = val!;
                              });
                            },
                            activeColor: kBlack,
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Veg',
                          style: MyFonts.w400.setColor(kBlack).size(12),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 8),
                   child: GestureDetector(
                      onTap: () {
                      setState(() {
                        selectedRadio = 1;
                      });
                    },
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: Radio(
                            value: 1,
                            groupValue: selectedRadio,
                            onChanged: (val) {
                              setState(() {
                                selectedRadio = val!;
                              });
                            },
                            activeColor: kBlack,
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Non-Veg',
                          style: MyFonts.w400.setColor(kBlack).size(12),
                        ),
                      ],
                                   ),
                   ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
