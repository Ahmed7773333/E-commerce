import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/app_colors.dart';
import 'package:shop_app/features/Home%20Layout/data/datasources/local/hive_helper/crud_helper.dart';

import '../../../../core/utils/app_images.dart';
import '../config/app_routes.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  Future<void> _navigateToHome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    if (!context.mounted) return;

    Navigator.of(context).pushReplacementNamed(
        CrudHelper.getAll().isEmpty ? Routes.login : Routes.homeLayout);
  }

  @override
  Widget build(BuildContext context) {
    _navigateToHome(context);

    return Scaffold(
      backgroundColor: AppColors.secondry,
      body: Center(
        child: Image.asset(
          AppImages.splach,
          height: 165.h,
          width: 396.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
