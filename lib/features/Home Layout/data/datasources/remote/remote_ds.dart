import 'package:dartz/dartz.dart';
import 'package:shop_app/core/eror/failuers.dart';

import '../../models/cart_product.dart';
import '../../models/categories_model.dart';
import '../../models/products_model.dart';
import '../../models/wish_list_product.dart';

abstract class HomeRemoteDs {
  Future<Either<Failures, WishListProductModel>> getWishList(String token);
  Future<Either<Failures, CartProductModel>> getCartList(String token);

  Future<Either<Failures, ProductsModel>> getAllProducts();
  Future<Either<Failures, CategoriesModel>> getAllCategories();
  Future<void> addToWishList(String id, String token);
  Future<void> addToCartList(String id, String token);
  Future<void> deleteFromWishList(String id, String token);
  Future<void> deleteFromCartList(String id, String token);
}
