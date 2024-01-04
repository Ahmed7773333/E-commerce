import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/componetns.dart';
import 'package:shop_app/features/Auth/presentation/bloc/auth_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class SignUpPage extends StatefulWidget {
  AuthBloc bloc;
  SignUpPage(this.bloc, {super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var keyy = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondry,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: keyy,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 75.h),
                Center(
                  child: Image.asset(
                    AppImages.whiteroute,
                    width: 237.w,
                    height: 71.10.h,
                  ),
                ),
                SizedBox(height: 46.9.h),
                Text(
                  AppStrings.fullName,
                  style: AppStyles.whiteLableStyle,
                ),
                SizedBox(height: 24.h),
                Components.customTextField(
                  context,
                  hint: AppStrings.fullNameHint,
                  controller: nameController,
                ),
                SizedBox(height: 32.h),
                Text(
                  AppStrings.phone,
                  style: AppStyles.whiteLableStyle,
                ),
                SizedBox(height: 24.h),
                Components.customTextField(
                  context,
                  hint: AppStrings.phoneHint,
                  controller: phoneController,
                ),
                SizedBox(height: 32.h),
                Text(
                  AppStrings.email,
                  style: AppStyles.whiteLableStyle,
                ),
                SizedBox(height: 24.h),
                Components.customTextField(
                  context,
                  hint: AppStrings.emailHint,
                  controller: emailController,
                ),
                SizedBox(height: 32.h),
                Text(
                  AppStrings.password,
                  style: AppStyles.whiteLableStyle,
                ),
                SizedBox(height: 24.h),
                Components.customTextField(
                  context,
                  hint: AppStrings.passwordHint,
                  controller: passwordController,
                  isPassword: true,
                  isShow: false,
                  onPressed: () {},
                ),
                SizedBox(height: 56.h),
                ElevatedButton(
                  onPressed: () {
                    if (keyy.currentState?.validate() ?? false) {
                      widget.bloc.add(SignUpEvent(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                        nameController.text.trim(),
                        phoneController.text.trim(),
                      ));
                    } else {
                      debugPrint('error');
                    }
                  },
                  child: Text(
                    AppStrings.signUp,
                    style: AppStyles.buttonTextStyle,
                  ),
                ),
                SizedBox(height: 32.h),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppStrings.alreadyHave,
                      style: AppStyles.whiteLableStyle,
                    ),
                  ),
                ),
                SizedBox(height: 75.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
