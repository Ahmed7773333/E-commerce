// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/features/Home%20Layout/presentation/bloc/home_layout_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/datasources/local/hive_helper/crud_helper.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  CartScreen(this.bloc, {super.key});
  HomeLayoutBloc bloc;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.bloc.cartList.length.toString());
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.cart),
          actions: [
            ImageIcon(
              const AssetImage(
                AppImages.search,
              ),
              size: 24.sp,
              color: AppColors.secondry,
            ),
            SizedBox(
              width: 16.w,
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 398.w,
                  height: (widget.bloc.cartList.length * 137).h,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.bloc.cartList.length,
                    itemBuilder: ((context, index) {
                      var item = widget.bloc.cartList[index];
                      return cartItem(item, widget.bloc, () {
                        String id = item.product?.id ?? '';
                        widget.bloc.cartList.removeWhere(
                            (element) => element.product!.id == id);
                        CrudHelper.getAll()
                            .first
                            .carts
                            .remove(item.product?.id ?? '');
                        CrudHelper.update(CrudHelper.getAll().first.key,
                            CrudHelper.getAll().first);
                        widget.bloc.add(DeleteCartEvent(id));
                        setState(() {});
                      });
                    }),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 24.h);
                    },
                  ),
                ),
                SizedBox(
                  height: 300.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          AppStrings.total,
                          style: AppStyles.erorStyle
                              .copyWith(color: AppColors.lightSecondry),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          '${AppStrings.egp} 1280',
                          style:
                              AppStyles.blueLableStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondry,
                          fixedSize: Size(270.w, 48.h)),
                      onPressed: () {},
                      child: Center(
                        child: Text(AppStrings.check,
                            style: AppStyles.whiteLableStyle),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
