import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/app_images.dart';
import 'package:shop_app/core/utils/app_strings.dart';
import 'package:shop_app/features/Home%20Layout/presentation/widgets/product_item.dart';
import 'package:shop_app/features/Home%20Layout/presentation/widgets/route_logo.dart';
import 'package:shop_app/features/Home%20Layout/presentation/widgets/search_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../bloc/home_layout_bloc.dart';

// ignore: must_be_immutable
class CategoriesTab extends StatefulWidget {
  CategoriesTab(this.bloc, {super.key});
  final HomeLayoutBloc bloc;
  bool right = false;

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  final TextEditingController searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final colorss = Theme.of(context).colorScheme;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
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
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (191 / 245),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemCount: widget.bloc.productsList.length,
                itemBuilder: (context, index) {
                  var item = widget.bloc.productsList[index];
                  return productItem(item, widget.bloc, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
