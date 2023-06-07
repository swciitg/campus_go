import 'package:flutter/material.dart';

import '../../functions/utility/show_snackbar.dart';
import '../../functions/utility/validator.dart';
import '../../globals/my_colors.dart';
import '../../globals/my_fonts.dart';
import '../../widgets/common/custom_text_field.dart';
import '../../widgets/ui/appbar.dart';

class AdminLoginPage extends StatefulWidget {
  static String id = "/login";
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Future<void> onFormSubmit() async {
      if (!_formKey.currentState!.validate()) {
        showSnackBar('Please give all the inputs correctly');
        return;
      } else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false);
      }
    }

    return Scaffold(
      appBar: appBar(context, "Admin Login",
          displayProfileIcon: false, displayBackButton: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Form(
                  key: _formKey,
                  child: Column(children: [
                    CustomTextField(
                      hintText: "Username",
                      isNecessary: true,
                      prefixIcon: const Icon(Icons.phone_outlined),
                      controller: _usernameController,
                      isEnabled: true,
                      inputType: TextInputType.phone,
                      validator: validateField,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextField(
                      hintText: "Password",
                      isNecessary: true,
                      prefixIcon: const Icon(Icons.key_outlined),
                      controller: _passwordController,
                      isEnabled: true,
                      inputType: TextInputType.visiblePassword,
                      validator: validateField,
                    ),
                  ])),
              Container(
                height: 32,
              ),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
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
            ]),
          ),
        ),
      ),
    );
  }
}
