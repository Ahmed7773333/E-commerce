import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/app_animations.dart';
import 'package:shop_app/features/Home%20Layout/presentation/pages/cart_page.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../bloc/home_layout_bloc.dart';
import '../../widgets/route_logo.dart';
import '../../widgets/search_field.dart';

class HomeTab extends StatefulWidget {
  const HomeTab(this.bloc, {super.key});
  final HomeLayoutBloc bloc;

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context, RightRouting(CartScreen(widget.bloc)));
                      },
                      icon: Image.asset(
                        AppImages.cart,
                        color: AppColors.secondry,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                Container(
                  height: 200.h,
                  width: 398.w,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage(AppImages.temp),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.category,
                        style: AppStyles.blueLableStyle,
                      ),
                      Text(
                        AppStrings.view,
                        style: AppStyles.smallLableStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 288.h,
                  width: 400.w,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: widget.bloc.categoriesList.length,
                    itemBuilder: (context, index) {
                      var item = widget.bloc.categoriesList[index];
                      return Column(
                        children: [
                          Container(
                            width: 100.w,
                            height: 100.h,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  item.image ?? "",
                                ),
                                fit: BoxFit.cover,
                              ),
                              shape: const OvalBorder(),
                            ),
                          ),
                          Text(
                            item.name ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.blueLableStyle,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 24.h),
                Text(AppStrings.appliance, style: AppStyles.blueLableStyle),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 130.h,
                  width: 400.w,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.bloc.productsList.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            width: 165.w,
                            height: 130.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(widget
                                        .bloc.productsList[index].imageCover ??
                                    ""),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.r),
                                  topRight: Radius.circular(15.r),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 15.w);
                    },
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
