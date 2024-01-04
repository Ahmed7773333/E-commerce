import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/app_colors.dart';

Widget activeTab({required String icon}) {
  return Container(
    height: 40.h,
    width: 40.w,
    decoration: ShapeDecoration(
      color: AppColors.primary,
      shape: const OvalBorder(),
    ),
    child: Center(
      child: ImageIcon(
        AssetImage(icon),
        size: 24.sp,
        color: AppColors.secondry,
      ),
    ),
  );
}

Widget notActiveTab({required String icon}) {
  return ImageIcon(
    AssetImage(icon),
    size: 24.sp,
    color: AppColors.primary,
  );
}
