import 'package:ecommerce_app/app/pages/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/route/navigation_service.dart';
import '../../../core/utils/constants.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'login_controller.dart';

class LoginSignUpPage extends StatefulWidget {
  const LoginSignUpPage({Key? key}) : super(key: key);

  static String get routeName => '/loginSignUp';

  @override
  State<LoginSignUpPage> createState() => _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> with TickerProviderStateMixin {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool visibility = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Controller do provider
    var loginController = Provider.of<LoginController>(context);

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Create Account',
                style: GoogleFonts.poppins(
                  color: Constants.blackColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Text(
                  'Enter your credentials to continue',
                  style: GoogleFonts.poppins(
                    color: Constants.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              CustomTextFormField(
                controller: _firstNameController,
                labelText: 'First Name',
                hint: 'First Name',
                keyboardType: TextInputType.text,
                //prefixIcon: const Icon(Icons.description),
                //onChanged: (value) => loginController.setLogin(value),
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                controller: _lastNameController,
                labelText: 'Last Name',
                hint: 'Last Name',
                keyboardType: TextInputType.text,
                //prefixIcon: const Icon(Icons.description),
                //onChanged: (value) => loginController.setLogin(value),
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                controller: _loginController,
                labelText: 'Email',
                hint: 'Email',
                keyboardType: TextInputType.emailAddress,
                //prefixIcon: const Icon(Icons.description),
                onChanged: (value) => loginController.setLogin(value),
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                controller: _passwordController,
                labelText: 'Password',
                hint: 'Password',
                keyboardType: TextInputType.text,
                obscureText: visibility,
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    visibility == true
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Constants.primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      visibility = !visibility;
                    });
                  },
                ),
                //value: loginController.birthdate,
                //onChange: (value) => loginController.setBirthdate(value),
              ),
              const SizedBox(height: 32),
              CustomElevatedButton(
                labelText: 'Sign Up',
                onTap: () {
                  navigationService.pushReplacement(LoginPage.routeName);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: GestureDetector(
                  onTap: () {
                    navigationService.pushReplacement(LoginPage.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: GoogleFonts.poppins(
                          color: Constants.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'sign up',
                        style: GoogleFonts.poppins(
                          color: Constants.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  'Or connect with',
                  style: GoogleFonts.poppins(
                    color: Constants.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: SizedBox(
                      width: 40,
                      height: 40,
                      child: SvgPicture.asset(
                        'assets/icons/facebook.svg',
                      ),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: SizedBox(
                      width: 40,
                      height: 40,
                      child: SvgPicture.asset(
                        'assets/icons/google.svg',
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
