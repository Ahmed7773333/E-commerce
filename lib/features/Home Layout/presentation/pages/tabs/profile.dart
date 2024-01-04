import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/app_animations.dart';
import 'package:shop_app/features/Auth/presentation/pages/sign_in.dart';
import 'package:shop_app/features/Home%20Layout/data/datasources/local/hive_helper/crud_helper.dart';
import 'package:shop_app/features/Home%20Layout/presentation/bloc/home_layout_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../widgets/profile_row.dart';
import '../../widgets/route_logo.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab(this.bloc, {Key? key}) : super(key: key);
  final HomeLayoutBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                routeLogo(),
                SizedBox(height: 24.h),
                Text('welcome,${bloc.user.name.substring(0, 5)}!',
                    style: AppStyles.blueLableStyle),
                SizedBox(height: 8.h),
                Text(bloc.user.email, style: AppStyles.blueLableStyle),
                SizedBox(height: 40.h),
                rowItem(
                  lable: AppStrings.uName,
                  hint: bloc.user.name,
                ),
                rowItem(
                  lable: AppStrings.uEmail,
                  hint: bloc.user.email,
                ),
                rowItem(
                  lable: AppStrings.upassword,
                  hint: '**********************',
                ),
                rowItem(
                  lable: AppStrings.uphone,
                  hint: '01122118855',
                ),
                rowItem(
                  lable: AppStrings.uaddress,
                  hint: '6th October, street 11.....',
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context,
                        LeftRouting(const SignInPage()), (route) => false);
                    CrudHelper.clear();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.logout_rounded, color: Colors.red, size: 28.r),
                      SizedBox(width: 10.w),
                      Text(
                        'Log out',
                        style: AppStyles.blueLableStyle
                            .copyWith(color: Colors.red),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 150.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
