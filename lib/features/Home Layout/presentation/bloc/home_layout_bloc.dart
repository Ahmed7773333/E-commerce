import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/core/eror/failuers.dart';
import 'package:shop_app/features/Home%20Layout/data/models/wish_list_product.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/add_cart.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/add_wish_list.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/delete_cart.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/delete_wish_list.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/get_all_categories.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/get_all_products.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/get_cart_list.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/get_wish_list.dart';

import '../../data/datasources/local/hive_helper/crud_helper.dart';
import '../../data/models/cart_product.dart';
import '../../data/models/categories_model.dart';
import '../../data/models/products_model.dart';

part 'home_layout_event.dart';
part 'home_layout_state.dart';

class HomeLayoutBloc extends Bloc<HomeLayoutEvent, HomeLayoutState> {
  static HomeLayoutBloc get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  DateTime initTime = DateTime.now();
  final user = CrudHelper.getAll().first;
  PageController pageController = PageController(initialPage: 0);
  GetWishListUseCase getWishListUseCase;
  GetAllCategories getAllCategories;
  GetAllProducts getAllProducts;
  GetCartListUseCase getCartListUseCase;
  AddCartUseCase addCartUseCase;
  AddWishListUseCase addWishListUseCase;
  DeleteCartUseCase deleteCartUseCase;
  DeleteWishListUseCase deleteWishListUseCase;
  List<Dataaa> wishList = [];
  List<Dataa> categoriesList = [];
  List<Data> productsList = [];
  List<Products> cartList = [];

  HomeLayoutBloc(
      this.getWishListUseCase,
      this.getAllCategories,
      this.getAllProducts,
      this.getCartListUseCase,
      this.addCartUseCase,
      this.deleteCartUseCase,
      this.addWishListUseCase,
      this.deleteWishListUseCase)
      : super(HomeLayoutInitial()) {
    on<HomeLayoutEvent>((event, emit) async {
      if (event is ChangePageEvent) {
        pageController = PageController(initialPage: event.index);
        emit(ChangePageState());
      } else if (event is GetWishListEvent) {
        emit(HomeLayoutInitial());
        var result = await getWishListUseCase(user.token);
        result.fold((l) {
          emit(GetWishListErrorState(l));
        }, (r) {
          wishList = r.data ?? [];
          if (CrudHelper.getAll().first.favs.length < wishList.length) {
            CrudHelper.getAll().first.favs.clear();
            wishList.toList().forEach((element) {
              CrudHelper.getAll().first.favs.add(element.id ?? '');
            });
            CrudHelper.update(
                CrudHelper.getAll().first.key, CrudHelper.getAll().first);
          }
          emit(GetWishListSuccessState(r));
        });
      } else if (event is GetCartListEvent) {
        emit(HomeLayoutInitial());
        var result = await getCartListUseCase(user.token);
        result.fold((l) {
          emit(GetCartListErrorState(l));
        }, (r) {
          cartList = r.data?.products ?? [];
          if (CrudHelper.getAll().first.carts.length < cartList.length) {
            CrudHelper.getAll().first.carts.clear();
            cartList.toList().forEach((element) {
              CrudHelper.getAll().first.carts.add(element.product?.id ?? '');
            });
            CrudHelper.update(
                CrudHelper.getAll().first.key, CrudHelper.getAll().first);
          }
          emit(GetCartListSuccessState(r));
        });
      } else if (event is GetAllCategoriesEvent) {
        emit(HomeLayoutInitial());
        var result = await getAllCategories();
        result.fold((l) {
          emit(GetAllCategoriesErrorState(l));
        }, (r) {
          categoriesList = r.data ?? [];
          emit(GetAllCategoriesSuccessState(r));
        });
      } else if (event is GetAllProductsEvent) {
        emit(HomeLayoutInitial());
        var result = await getAllProducts();
        result.fold((l) {
          emit(GetAllProductsErrorState(l));
        }, (r) {
          productsList = r.data ?? [];
          emit(GetAllProductsSuccessState(r));
        });
      } else if (event is AddCartEvent) {
        emit(OperationState());

        await addCartUseCase(event.id, CrudHelper.getAll().first.token);
        var result = await getCartListUseCase(CrudHelper.getAll().first.token);
        result.fold((l) {}, (r) {
          cartList = r.data?.products ?? [];
          emit(AddCartState());
        });
        emit(AddCartState());
      } else if (event is AddWishEvent) {
        emit(OperationState());

        await addWishListUseCase(event.id, CrudHelper.getAll().first.token);
        var result = await getWishListUseCase(CrudHelper.getAll().first.token);
        result.fold((l) {}, (r) {
          wishList = r.data ?? [];
          emit(AddWishState());
        });
        emit(AddWishState());
      } else if (event is DeleteCartEvent) {
        emit(OperationState());

        await deleteCartUseCase(event.id, CrudHelper.getAll().first.token);
        var result = await getCartListUseCase(CrudHelper.getAll().first.token);
        result.fold((l) {}, (r) {
          cartList = r.data?.products ?? [];
          emit(DeleteCartState());
        });
        emit(DeleteCartState());
      } else if (event is DeleteWishEvent) {
        emit(OperationState());

        await deleteWishListUseCase(event.id, CrudHelper.getAll().first.token);
        var result = await getWishListUseCase(CrudHelper.getAll().first.token);
        result.fold((l) {}, (r) {
          wishList = r.data ?? [];
          emit(DeleteWishState());
        });
        emit(DeleteWishState());
      }
    });
  }
}
