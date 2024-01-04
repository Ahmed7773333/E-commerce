import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/api/api_manager.dart';
import 'package:shop_app/features/Home%20Layout/data/datasources/remote/remote_ds_impl.dart';
import 'package:shop_app/features/Home%20Layout/data/repositories/home_repo_impl.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/add_cart.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/add_wish_list.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/delete_cart.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/delete_wish_list.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/get_all_categories.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/get_all_products.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/get_cart_list.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/get_wish_list.dart';
import 'package:shop_app/features/Home%20Layout/presentation/pages/tabs/categories.dart';
import 'package:shop_app/features/Home%20Layout/presentation/pages/tabs/favorite.dart';
import 'package:shop_app/features/Home%20Layout/presentation/pages/tabs/home.dart';
import 'package:shop_app/features/Home%20Layout/presentation/pages/tabs/profile.dart';

import '../../../../core/utils/app_images.dart';
import '../bloc/home_layout_bloc.dart';
import '../widgets/active_non_active.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  // int _currentIndex = 0;
  // late PageController _pageController;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutBloc(
          GetWishListUseCase(HomeRepoImpl(HomeRemoteDsImple(ApiManager()))),
          GetAllCategories(HomeRepoImpl(HomeRemoteDsImple(ApiManager()))),
          GetAllProducts(HomeRepoImpl(HomeRemoteDsImple(ApiManager()))),
          GetCartListUseCase(HomeRepoImpl(HomeRemoteDsImple(ApiManager()))),
          AddCartUseCase(HomeRepoImpl(HomeRemoteDsImple(ApiManager()))),
          DeleteCartUseCase(HomeRepoImpl(HomeRemoteDsImple(ApiManager()))),
          AddWishListUseCase(HomeRepoImpl(HomeRemoteDsImple(ApiManager()))),
          DeleteWishListUseCase(HomeRepoImpl(HomeRemoteDsImple(ApiManager()))))
        ..add(GetAllCategoriesEvent())
        ..add(GetAllProductsEvent())
        ..add(GetWishListEvent())
        ..add(GetCartListEvent()),
      child: BlocConsumer<HomeLayoutBloc, HomeLayoutState>(
        listener: (context, state) {
          if (state is HomeLayoutInitial) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Center(child: CircularProgressIndicator()),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            );
          } else if (state is GetWishListSuccessState ||
              state is GetAllCategoriesSuccessState ||
              state is GetAllProductsSuccessState ||
              state is GetCartListSuccessState) {
            Navigator.pop(context);
          } else if (state is GetWishListErrorState) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(state.error.message),
              ),
            );
          } else if (state is GetAllCategoriesErrorState) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(state.error.message),
              ),
            );
          } else if (state is GetAllProductsErrorState) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(state.error.message),
              ),
            );
          } else if (state is GetCartListErrorState) {
            debugPrint(state.error.message);
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(state.error.message),
              ),
            );
          } else if (state is AddCartState ||
              state is AddWishState ||
              state is DeleteCartState ||
              state is DeleteWishState) {
            setState(() {});
          }
        },
        builder: (context, state) {
          final bloc = HomeLayoutBloc.get(context);
          // final colors = Theme.of(context).colorScheme;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: PageView(
              controller: bloc.pageController,
              children: [
                HomeTab(bloc),
                CategoriesTab(bloc),
                FavoriteTab(bloc),
                ProfileTab(bloc),
              ],
              onPageChanged: (index) {
                bloc.add(ChangePageEvent(index: index));
                bloc.currentIndex = index;
              },
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(18.r),
                topLeft: Radius.circular(18.r),
              ),
              child: BottomNavigationBar(
                currentIndex: bloc.currentIndex,
                onTap: (index) {
                  bloc.pageController.jumpToPage(index);
                  bloc.currentIndex = index;
                },
                items: [
                  BottomNavigationBarItem(
                    icon: notActiveTab(icon: AppImages.home),
                    label: '',
                    activeIcon: activeTab(icon: AppImages.home),
                  ),
                  BottomNavigationBarItem(
                    icon: notActiveTab(icon: AppImages.category),
                    label: '',
                    activeIcon: activeTab(icon: AppImages.category),
                  ),
                  BottomNavigationBarItem(
                    icon: notActiveTab(icon: AppImages.favorite),
                    label: '',
                    activeIcon: activeTab(icon: AppImages.favorite),
                  ),
                  BottomNavigationBarItem(
                    icon: notActiveTab(icon: AppImages.profile),
                    label: '',
                    activeIcon: activeTab(icon: AppImages.profile),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
