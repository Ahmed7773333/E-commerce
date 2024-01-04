import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/features/Home%20Layout/data/datasources/local/hive_helper/crud_helper.dart';
import 'package:shop_app/features/Home%20Layout/presentation/bloc/home_layout_bloc.dart';

import '../../../../core/utils/app_animations.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/models/products_model.dart';
import '../pages/details_page.dart';

Widget productItem(Data item, HomeLayoutBloc bloc, context) {
  return InkWell(
    onTap: () {
      Navigator.push(context, TopRouting(ProductDetails(bloc, item)));
    },
    child: Container(
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: AppColors.lightSecondry),
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.network(
              item.imageCover ?? '',
              fit: BoxFit.cover,
              height: 150.h,
              width: 191.w,
            ),
          ),
          Positioned(
            top: 3.h,
            right: 3.w,
            child: InkWell(
              onTap: () {
                CrudHelper.getAll().first.favs.add(item.id ?? '');
                CrudHelper.update(
                    CrudHelper.getAll().first.key, CrudHelper.getAll().first);
                bloc.add(AddWishEvent(item.id ?? ''));
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: ShapeDecoration(
                  color: AppColors.primary,
                  shape: const OvalBorder(),
                ),
                child: Center(
                  child: ImageIcon(
                    AssetImage(CrudHelper.getAll().first.favs.contains(item.id)
                        ? AppImages.heart
                        : AppImages.favorite),
                    color: AppColors.secondry,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 65.h,
            left: 8.w,
            child: Text(
              item.title?.substring(
                      0, item.title!.length >= 20 ? 20 : item.title?.length) ??
                  '',
              style: AppStyles.blueLableStyle.copyWith(
                fontSize: 13,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Positioned(
            bottom: 39.h,
            left: 8.w,
            child: Text(
              '${AppStrings.egp} ${item.price}',
              style: AppStyles.blueLableStyle.copyWith(fontSize: 14),
            ),
          ),
          Positioned(
            bottom: 13.h,
            left: 5.w,
            child: Text(
              '${AppStrings.review} (${item.ratingsAverage}) ',
              style: AppStyles.blueLableStyle.copyWith(fontSize: 14),
            ),
          ),
          Positioned(
            bottom: 16.h,
            left: 95.w,
            child: Image.asset(
              AppImages.star,
              height: 15.h,
              width: 15.w,
            ),
          ),
          Positioned(
            bottom: 8.h,
            left: 153.w,
            child: ImageIcon(
              const AssetImage(AppImages.plus),
              size: 24.sp,
              color: AppColors.secondry,
            ),
          ),
        ],
      ),
    ),
  );
}
