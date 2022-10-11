import 'package:ecommerce_app/app/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';
import '../../widgets/cliprrect_photo_widget.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../main/bottom_navigation_bar_controller_view_model.dart';

class ProfileEditView extends StatefulWidget {
  const ProfileEditView({Key? key}) : super(key: key);

  static String get routeName => '/profile_edit';

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var bottomNavigationController = Provider.of<BottomNavigationBarProviderController>(context);
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
                    Row(
                      children: [
                        SizedBox(
                          width: Utils.mediaQuery(context, 0.5),
                          child: CustomTextFormField(
                            controller: _genderController,
                            labelText: 'Gender',
                            hint: 'Gender',
                            keyboardType: TextInputType.emailAddress,
                            paddingRight: 8,
                            //prefixIcon: const Icon(Icons.description),
                            //onChanged: (value) => _genderController.setLogin(value),
                          ),
                        ),
                        SizedBox(
                          width: Utils.mediaQuery(context, 0.5),
                          child: CustomTextFormField(
                            controller: _birthdayController,
                            labelText: 'Birthday',
                            hint: 'Birthday',
                            keyboardType: TextInputType.emailAddress,
                            paddingLeft: 8,
                            //prefixIcon: const Icon(Icons.description),
                            //onChanged: (value) => loginController.setLogin(value),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: _phoneController,
                      labelText: 'Phone number',
                      hint: 'Phone number',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: _emailController,
                      labelText: 'Email',
                      hint: 'Email',
                      keyboardType: TextInputType.text,
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
