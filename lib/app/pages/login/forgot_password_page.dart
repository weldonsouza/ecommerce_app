import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/constants.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  static String get routeName => '/forgot_pass';

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _loginController = TextEditingController();

  bool visibility = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Controller do provider
    //var loginController = Provider.of<LoginProviderController>(context);

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: AppBar(
        backgroundColor: Constants.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Forgot Password',
          style: GoogleFonts.poppins(
            color: Constants.blackColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Text(
                  'Enter your email to proceed.',
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
                //onChanged: (value) => loginController.setLogin(value),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CustomElevatedButton(
              labelText: 'Recover',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
