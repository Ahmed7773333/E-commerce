// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

Widget rowItem({
  required String lable,
  required String hint,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        lable,
        style: AppStyles.blueLableStyle,
      ),
      SizedBox(height: 16.h),
      Container(
        width: 398.w,
        height: 54.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColors.lightSecondry),
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              hint,
              style: AppStyles.blueLableStyle.copyWith(fontSize: 14),
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                AppImages.edit,
                color: AppColors.secondry,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 24.h),
    ],
  );
}
