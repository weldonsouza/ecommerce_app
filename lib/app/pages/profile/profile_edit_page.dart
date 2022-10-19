import 'package:ecommerce_app/app/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../core/utils/constants.dart';
import '../../widgets/cliprrect_photo_widget.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  static String get routeName => '/profile_edit';

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  var maskPhoneFormatter = MaskTextInputFormatter(mask: '+## (##) #####-####', filter: { "#": RegExp(r'[0-9]') });
  var maskDateFormatter = MaskTextInputFormatter(mask: '##/##/####', filter: { "#": RegExp(r'[0-9]') });
  List<String> list = <String>['Gender', 'Male', 'Female'];
  String dropdownValue = 'Gender';

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: CustomAppBar(
        context,
        title: 'Edit Profile',
        isBackButtonVisible: true,
        onTapButtonBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(color: Constants.blackColor),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: ClipRRectPhotoWidget(
                                photo: args['photo'],
                                color: Constants.whiteColor,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Constants.blackColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: CustomIconButton(
                              widget: SvgPicture.asset(
                                'assets/icons/camera.svg',
                                width: 12,
                                height: 12,
                                color: Constants.whiteColor,
                              ),
                              color: Constants.blackColor,
                              borderRadius: 100,
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      args['name'],
                      style: GoogleFonts.poppins(
                        color: Constants.blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      args['email'],
                      style: GoogleFonts.poppins(
                        color: Constants.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: Utils.mediaQuery(context, 1),
                      height: 1,
                      color: Constants.textFieldDisable,
                      margin: EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 16),
                    ),
                    CustomTextFormField(
                      controller: _fullNameController,
                      labelText: 'Full Name',
                      hint: 'Full Name',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: _userNameController,
                      labelText: 'User Name',
                      hint: args['userName'],
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Utils.mediaQuery(context, 0.44),
                          height: 60,
                          margin: EdgeInsets.only(left: 16),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(color: Constants.textField),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                itemHeight: 60,
                                elevation: 0,
                                isExpanded: true,
                                underline: Container(),
                                onChanged: (String? value) {
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Text(
                                        value,
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: Constants.textField,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Utils.mediaQuery(context, 0.5),
                          child: CustomTextFormField(
                            controller: _birthdayController,
                            labelText: 'Birthday',
                            hint: 'Birthday',
                            keyboardType: TextInputType.number,
                            inputFormatters: [maskDateFormatter],
                            paddingLeft: 8,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: _phoneController,
                      labelText: 'Phone number',
                      hint: 'Phone number',
                      keyboardType: TextInputType.phone,
                      inputFormatters: [maskPhoneFormatter],
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: _emailController,
                      labelText: 'Email',
                      hint: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 28),
                  child: CustomElevatedButton(
                    labelText: 'Save',
                    width: Utils.mediaQuery(context, 1),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
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
