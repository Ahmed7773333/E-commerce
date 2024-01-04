import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/features/Home%20Layout/presentation/widgets/favorite_item.dart';
import 'package:shop_app/features/Home%20Layout/presentation/widgets/route_logo.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../data/models/wish_list_product.dart';
import '../../bloc/home_layout_bloc.dart';
import '../../widgets/search_field.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab(this.bloc, {super.key});
  final HomeLayoutBloc bloc;

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  final TextEditingController searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                routeLogo(),
                SizedBox(height: 18.h),
                Row(
                  children: [
                    SearchBarField(
                      hint: AppStrings.searchHint,
                      controller: searchBarController,
                      onChange: () {},
                      onPressed: () {},
                    ),
                    SizedBox(width: 24.w),
                    Image.asset(
                      AppImages.cart,
                      color: AppColors.secondry,
                      height: 30.h,
                      width: 30.w,
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                SizedBox(
                  width: 430.w,
                  height: (widget.bloc.wishList.length * 150).h,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.bloc.wishList.length,
                    itemBuilder: ((context, index) {
                      Dataaa item = widget.bloc.wishList[index];
                      return favoriteItem(item, widget.bloc);
                    }),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 24.h);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
