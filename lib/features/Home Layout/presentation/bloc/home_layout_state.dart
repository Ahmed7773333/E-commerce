// ignore_for_file: must_be_immutable

part of 'home_layout_bloc.dart';

@immutable
class HomeLayoutState {}

class HomeLayoutInitial extends HomeLayoutState {
  HomeLayoutInitial() : super();
}

class ChangePageState extends HomeLayoutState {}

class GetWishListSuccessState extends HomeLayoutState {
  WishListProductModel wishListProductModel;
  GetWishListSuccessState(this.wishListProductModel);
}

class GetWishListErrorState extends HomeLayoutState {
  Failures error;
  GetWishListErrorState(this.error);
}

class GetCartListSuccessState extends HomeLayoutState {
  CartProductModel wishListProductModel;
  GetCartListSuccessState(this.wishListProductModel);
}

class GetCartListErrorState extends HomeLayoutState {
  Failures error;
  GetCartListErrorState(this.error);
}

class GetAllCategoriesSuccessState extends HomeLayoutState {
  CategoriesModel wishListProductModel;
  GetAllCategoriesSuccessState(this.wishListProductModel);
}

class GetAllCategoriesErrorState extends HomeLayoutState {
  Failures error;
  GetAllCategoriesErrorState(this.error);
}

class GetAllProductsSuccessState extends HomeLayoutState {
  ProductsModel wishListProductModel;
  GetAllProductsSuccessState(this.wishListProductModel);
}

class GetAllProductsErrorState extends HomeLayoutState {
  Failures error;
  GetAllProductsErrorState(this.error);
}

class AddCartState extends HomeLayoutState {}

class AddWishState extends HomeLayoutState {}

class DeleteCartState extends HomeLayoutState {}

class DeleteWishState extends HomeLayoutState {}

class OperationState extends HomeLayoutState {}
