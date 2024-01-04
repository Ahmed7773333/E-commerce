import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/features/Home%20Layout/presentation/bloc/home_layout_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/models/cart_product.dart';

Widget cartItem(Products item, HomeLayoutBloc bloc, VoidCallback onDelete) {
  return Container(
    width: 398.w,
    height: 113.h,
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: AppColors.bordarColor),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          left: 0,
          child: Container(
            width: 120.w,
            height: 113.h,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(item.product?.imageCover ?? ''),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: AppColors.bordarColor),
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
          ),
        ),
        Positioned(
          top: 16.h,
          left: 128.w,
          child: Text(
              item.product?.title?.substring(
                      0,
                      item.product!.title!.length >= 20
                          ? 20
                          : item.product!.title!.length) ??
                  '',
              style: AppStyles.blueLableStyle),
        ),
        Positioned(
          top: 47.h,
          left: 151.w,
          child: Text(item.product?.category?.name ?? '',
              style: AppStyles.smallLableStyle),
        ),
        Positioned(
          top: 81.h,
          left: 128.w,
          child: Text(
            'rating: ${item.product?.ratingsAverage}',
            style: AppStyles.blueLableStyle.copyWith(fontSize: 12),
          ),
        ),
        Positioned(
          top: 4.h,
          left: 356.w,
          child: IconButton(
            onPressed: () {
              onDelete();
            },
            icon: Image.asset(
              AppImages.delete,
            ),
          ),
        ),
        Positioned(
          top: 63.h,
          left: 268.w,
          child: Container(
            width: 122.w,
            height: 42.h,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: AppColors.secondry,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(AppImages.substruct),
                  Text(item.count.toString(),
                      textAlign: TextAlign.center,
                      style: AppStyles.whiteLableStyle),
                  Image.asset(AppImages.plusC),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
