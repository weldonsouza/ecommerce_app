import 'package:ecommerce_app/app/widgets/custom_button.dart';
import 'package:ecommerce_app/app/widgets/custom_button_next.dart';
import 'package:ecommerce_app/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  static String get routeName => '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _loginController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Controller do provider
    var loginController = Provider.of<LoginProviderController>(context);

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 16, right: 16, bottom: 90),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: GoogleFonts.raleway(
                    color: Constants.blackColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 40),
                  child: Text(
                    'Sign in to continue!',
                    style: GoogleFonts.raleway(
                      color: Constants.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: _loginController,
                  labelText: 'Email',
                  hint: 'Email',
                  keyboardType: TextInputType.number,
                  fontWeight: FontWeight.w700,
                  //prefixIcon: const Icon(Icons.description),
                  onChanged: (value) => loginController.setLogin(value),
                ),
                const SizedBox(height: 12),
                const CustomTextFormField(
                  //controller: _loginController,
                  labelText: 'Data de nascimento',
                  hint: 'Data de nascimento',
                  keyboardType: TextInputType.number,
                  fontWeight: FontWeight.w700,
                  prefixIcon: Icon(Icons.cake),
                  //value: loginController.birthdate,
                  //onChange: (value) => loginController.setBirthdate(value),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 20),
                      child: Text(
                        'Remember',
                        style: GoogleFonts.raleway(
                          color: Constants.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 20),
                      child: Text(
                        'Forgot password?',
                        style: GoogleFonts.raleway(
                          color: Constants.errorSnackBarColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  width: Utils.mediaQuery(context, 1),
                  height: 44,
                  labelText: 'Sign In',
                  onTap: () {},
                ),
                ButtonNextStep(
                  label: 'Sign In',
                  onTap: () {},
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "Don't have an account? sign up",
                    style: GoogleFonts.raleway(
                      color: Constants.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    'Or connect with',
                    style: GoogleFonts.raleway(
                      color: Constants.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
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
