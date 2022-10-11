import 'package:ecommerce_app/app/widgets/custom_elevated_button.dart';
import 'package:ecommerce_app/app/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/route/navigation_service.dart';
import '../../../core/utils/constants.dart';
import '../main/bottom_navigation_bar_controller.dart';
import 'forgot_password_view.dart';
import 'login_signup_view.dart';
import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  static String get routeName => '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool toggleValue = false;
  bool visibility = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var loginController = Provider.of<LoginProviderController>(context);

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: GoogleFonts.poppins(
                  color: Constants.blackColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Text(
                  'Sign in to continue!',
                  style: GoogleFonts.poppins(
                    color: Constants.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
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
              Padding(
                padding: const EdgeInsets.only(right: 16, bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: 0.5,
                          child: CupertinoSwitch(
                            value: toggleValue,
                            activeColor: Constants.successSnackBarColor,
                            trackColor: Constants.primaryColor,
                            thumbColor: Constants.whiteColor,
                            onChanged: (value) => {
                              setState(() {
                                toggleValue = value;
                              },
                              ),
                            },
                          ),
                        ),
                        Text(
                          'Remember',
                          style: GoogleFonts.poppins(
                            color: Constants.blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        navigationService.push(ForgotPasswordView.routeName);
                      },
                      child: Text(
                        'Forgot password?',
                        style: GoogleFonts.poppins(
                          color: Constants.errorSnackBarColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomElevatedButton(
                labelText: 'Sign In',
                onTap: () {
                  navigationService.pushReplacement(BottomNavigationBarController.routeName);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: GestureDetector(
                  onTap: () {
                    navigationService.pushReplacement(LoginSignUpView.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
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
                padding: const EdgeInsets.only(top: 40, bottom: 8),
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
