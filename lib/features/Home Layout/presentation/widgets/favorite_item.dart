import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/features/Home%20Layout/presentation/bloc/home_layout_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/datasources/local/hive_helper/crud_helper.dart';
import '../../data/models/wish_list_product.dart';

Widget favoriteItem(Dataaa item, HomeLayoutBloc bloc) {
  return Container(
    width: 430.w,
    height: 113.h,
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: AppColors.bordarColor),
        borderRadius: BorderRadius.circular(15.r),
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
                image: NetworkImage(item.imageCover ?? ''),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: AppColors.bordarColor),
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
          ),
        ),
        Positioned(
          top: 14.h,
          left: 128.w,
          child: Text(
              item.title?.substring(
                      0, item.title!.length >= 20 ? 20 : item.title?.length) ??
                  '',
              style: AppStyles.blueLableStyle),
        ),
        Positioned(
          top: 46.h,
          left: 154.w,
          child: Text(
              item.slug?.substring(
                      0, item.title!.length >= 20 ? 20 : item.title?.length) ??
                  '',
              style: AppStyles.smallLableStyle),
        ),
        Positioned(
          top: 79.h,
          left: 128.w,
          child: Text(
            '${AppStrings.egp} ${item.price}',
            style: AppStyles.blueLableStyle.copyWith(fontSize: 12),
          ),
        ),
        Positioned(
          top: 81.h,
          left: 218.w,
          child: Icon(
            Icons.star,
            size: 13.r,
            color: Colors.yellow,
          ),
        ),
        Positioned(
          top: 78.h,
          left: 234.w,
          child: Text('(${item.ratingsAverage})',
              style: AppStyles.smallLableStyle),
        ),
        Positioned(
          top: 65.h,
          left: 282.w,
          child: Container(
            width: 90,
            height: 36,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: AppColors.secondry,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Center(
              child: Text(
                AppStrings.add,
                style: AppStyles.smallStyle.copyWith(fontSize: 10),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 345.w,
          child: IconButton(
            onPressed: () {
              String id = item.id ?? '';
              bloc.wishList.removeWhere((element) => element.id == id);
              CrudHelper.getAll().first.favs.remove(item.id ?? '');
              CrudHelper.update(
                  CrudHelper.getAll().first.key, CrudHelper.getAll().first);
              bloc.add(DeleteWishEvent(id));
            },
            icon: Image.asset(
              AppImages.heart,
            ),
          ),
        ),
      ],
    ),
  );
}
