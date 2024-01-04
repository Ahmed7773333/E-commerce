// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class SearchBarField extends StatelessWidget {
  final String hint;
  final VoidCallback? onPressed;
  final VoidCallback? onChange;

  final TextEditingController controller;

  const SearchBarField({
    super.key,
    required this.hint,
    this.onPressed,
    this.onChange,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: TextField(
          controller: controller,
          onChanged: (value) {
            onChange;
          },
          decoration: InputDecoration(
            hintText: hint,
            focusColor: AppColors.primary,
            fillColor: AppColors.primary,
            filled: true,
            hintStyle:
                AppStyles.hintStyle.copyWith(color: AppColors.totalColor),
            prefixStyle: AppStyles.blueLableStyle,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(
                color: AppColors.secondry,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(
                color: AppColors.secondry,
              ),
            ),
            enabled: true,
            prefixIcon: InkWell(
              onTap: onPressed,
              child: ImageIcon(
                const AssetImage(
                  AppImages.search,
                ),
                size: 24.sp,
                color: AppColors.secondry,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(
                color: AppColors.secondry,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(
                color: AppColors.secondry,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
