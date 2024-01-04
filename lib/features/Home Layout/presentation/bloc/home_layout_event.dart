// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'home_layout_bloc.dart';

abstract class HomeLayoutEvent extends Equatable {
  const HomeLayoutEvent();

  @override
  List<Object> get props => [];
}

class ChangePageEvent extends HomeLayoutEvent {
  int index;
  ChangePageEvent({
    required this.index,
  });
}

class GetWishListEvent extends HomeLayoutEvent {}

class GetCartListEvent extends HomeLayoutEvent {}

class GetAllCategoriesEvent extends HomeLayoutEvent {}

class GetAllProductsEvent extends HomeLayoutEvent {}

class AddCartEvent extends HomeLayoutEvent {
  String id;
  AddCartEvent(this.id);
}

class AddWishEvent extends HomeLayoutEvent {
  String id;
  AddWishEvent(this.id);
}

class DeleteCartEvent extends HomeLayoutEvent {
  String id;
  DeleteCartEvent(this.id);
}

class DeleteWishEvent extends HomeLayoutEvent {
  String id;
  DeleteWishEvent(this.id);
}
