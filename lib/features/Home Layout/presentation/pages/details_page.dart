import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/features/Home%20Layout/presentation/bloc/home_layout_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/datasources/local/hive_helper/crud_helper.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails(this.bloc, this.item, {super.key});
  final HomeLayoutBloc bloc;
  final dynamic item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.detailsTitle),
        actions: [
          ImageIcon(
            const AssetImage(
              AppImages.search,
            ),
            size: 24.sp,
            color: AppColors.secondry,
          ),
          SizedBox(width: 32.w),
          Image.asset(
            AppImages.cart,
            color: AppColors.secondry,
            height: 30.h,
            width: 30.w,
          ),
          SizedBox(width: 16.w),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            left: 16.w,
            top: 0,
            child: Container(
              height: 200.h,
              width: 398.w,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(item.imageCover ?? ''),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
            ),
          ),
          Positioned(
            left: 16.w,
            top: 335.h,
            child: Text(
              item.title.substring(
                      0, item.title!.length >= 40 ? 40 : item.title?.length) ??
                  '',
              style: AppStyles.blueLableStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Positioned(
            right: 16.w,
            top: 335.h,
            child: Text(
              '${AppStrings.egp} ${item.price}',
              style: AppStyles.blueLableStyle.copyWith(fontSize: 12.sp),
            ),
          ),
          Positioned(
            left: 16.w,
            top: 369.h,
            child: Container(
              width: 102.w,
              height: 34.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: AppColors.lightSecondry,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  '(${item.sold}) Sold',
                  style: AppStyles.smallLableStyle,
                ),
              ),
            ),
          ),
          Positioned(
            left: 134.w,
            bottom: 460.h,
            child: Image.asset(AppImages.star),
          ),
          Positioned(
            left: 153.w,
            bottom: 458.h,
            child: Text(
              '${item.ratingsAverage}(${item.ratingsQuantity})',
              style: AppStyles.smallLableStyle,
            ),
          ),
          Positioned(
            left: 292.w,
            bottom: 424.h,
            child: Container(
              width: 122.w,
              height: 42.h,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: AppColors.secondry,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(AppImages.substruct),
                    Text('1',
                        textAlign: TextAlign.center,
                        style: AppStyles.whiteLableStyle),
                    Image.asset(AppImages.plusC),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 16.w,
            bottom: 416.h,
            child:
                Text(AppStrings.description, style: AppStyles.blueLableStyle),
          ),
          Positioned(
            left: 16.w,
            bottom: 354.h,
            child: Text(
              item.description,
              style: AppStyles.smallLableStyle,
            ),
          ),
          Positioned(
            left: 16.w,
            bottom: 320.h,
            child: Text(AppStrings.size, style: AppStyles.blueLableStyle),
          ),
          Positioned(
            left: 16.w,
            bottom: 243.h,
            child: Text(AppStrings.color, style: AppStyles.blueLableStyle),
          ),
          Positioned(
            left: 16.w,
            bottom: 134.h,
            child: Text(
              AppStrings.total,
              style:
                  AppStyles.erorStyle.copyWith(color: AppColors.lightSecondry),
            ),
          ),
          Positioned(
            left: 16.w,
            bottom: 104.h,
            child: Text(
              '${AppStrings.egp} ${item.price}',
              style: AppStyles.blueLableStyle.copyWith(fontSize: 12),
            ),
          ),
          Positioned(
            left: 144.w,
            bottom: 104.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondry,
                  fixedSize: Size(267.w, 48.h)),
              onPressed: () {
                CrudHelper.getAll().first.carts.add(item.id ?? '');
                CrudHelper.update(
                    CrudHelper.getAll().first.key, CrudHelper.getAll().first);
                bloc.add(AddCartEvent(item.id ?? ''));
              },
              child: Center(
                child: Text(AppStrings.add, style: AppStyles.whiteLableStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
