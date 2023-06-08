import 'package:campus_go/functions/utility/validator.dart';
import 'package:campus_go/globals/enums.dart';
import 'package:campus_go/globals/my_colors.dart';
import 'package:campus_go/pages/home/home_page.dart';
import 'package:campus_go/stores/user_store.dart';
import 'package:campus_go/widgets/common/custom_text_field.dart';
import 'package:campus_go/widgets/ui/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../functions/utility/show_snackbar.dart';
import '../../globals/my_fonts.dart';

class ProfileSetup extends StatefulWidget {
  static String id = "/ps";
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _altEmailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _deliveryLocationController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if(context.read<UserStore>().viewType==ViewType.user){_nameController.text = context.read<UserStore>().userData['username']!;
    _emailController.text = context.read<UserStore>().userData['email']!;
    _altEmailController.text = context.read<UserStore>().userData['alternateEmail']!;
    _phoneController.text = context.read<UserStore>().userData['phoneNo']!;
    _deliveryLocationController.text = context.read<UserStore>().userData['deliveryLocation']!;}
  }

  @override
  Widget build(BuildContext context) {
    Future<void> onFormSubmit() async {
      if (!_formKey.currentState!.validate()) {
        showSnackBar('Please give all the inputs correctly');
        return;
      } else {
        var data={
          'username':_nameController.text,
          'email':_emailController.text,
          'alternateEmail':_altEmailController.text,
          'phoneNo':_phoneController.text,
          'deliveryLocation':_deliveryLocationController.text,
          'id':'',
        };
        var shredPrefs= await SharedPreferences.getInstance();
        context.read<UserStore>().saveToPreferences(shredPrefs, data);
        context.read<UserStore>().saveToUserData(shredPrefs);

        Navigator.of(context)
            .pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
            
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar(context, "Profile Setup",
          displayProfileIcon: false,
          displayBackButton: true,
          displayLogoutButton: true),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0
          ? null
          : Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SizedBox(
                height: 56,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    onPressed: (() {
                      onFormSubmit();
                    }),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kBlack,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      "Submit",
                      style: MyFonts.w400.setColor(kWhite).size(18),
                    ),
                  ),
                ),
              ),
          ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SingleChildScrollView(
          child: Column(children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: 'NOTE:',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                          color: kBlack,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text:
                          ' Name & Email field cannot be changed as they are based on your outlook account information',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: kBlack,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Form(
                key: _formKey,
                child: Column(children: [
                  CustomTextField(
                    hintText: "Full Name",
                    isNecessary: false,
                    prefixIcon: const Icon(Icons.person_outline_outlined),
                    controller: _nameController,
                    isEnabled: false,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextField(
                    hintText: "Email",
                    isNecessary: false,
                    prefixIcon: const Icon(Icons.email_outlined),
                    controller: _emailController,
                    isEnabled: false,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextField(
                    hintText: "Contact No.",
                    isNecessary: true,
                    prefixIcon: const Icon(Icons.phone_outlined),
                    controller: _phoneController,
                    isEnabled: true,
                    inputType: TextInputType.phone,
                    validator: validateField,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextField(
                    hintText: "Alternate Email",
                    isNecessary: true,
                    prefixIcon: const Icon(Icons.email_outlined),
                    controller: _altEmailController,
                    isEnabled: true,
                    inputType: TextInputType.emailAddress,
                    validator: validateField,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextField(
                    hintText: "Delivery Location",
                    isNecessary: false,
                    controller: _deliveryLocationController,
                    prefixIcon: const Icon(Icons.location_on_outlined),
                    inputType: TextInputType.streetAddress,
                  ),
                ]))
          ]),
        ),
      ),
    );
  }
}
