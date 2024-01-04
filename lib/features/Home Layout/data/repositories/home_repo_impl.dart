import 'package:dartz/dartz.dart';
import 'package:shop_app/core/eror/failuers.dart';
import 'package:shop_app/features/Home%20Layout/data/datasources/remote/remote_ds_impl.dart';
import 'package:shop_app/features/Home%20Layout/data/models/cart_product.dart';
import 'package:shop_app/features/Home%20Layout/data/models/categories_model.dart';
import 'package:shop_app/features/Home%20Layout/data/models/products_model.dart';
import 'package:shop_app/features/Home%20Layout/data/models/wish_list_product.dart';
import '../../domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRemoteDsImple homeRemoteDsImple;
  HomeRepoImpl(this.homeRemoteDsImple);

  @override
  Future<Either<Failures, WishListProductModel>> getWishList(String token) {
    return homeRemoteDsImple.getWishList(token);
  }

  @override
  Future<Either<Failures, CategoriesModel>> getAllCategories() {
    return homeRemoteDsImple.getAllCategories();
  }

  @override
  Future<Either<Failures, ProductsModel>> getAllProducts() {
    return homeRemoteDsImple.getAllProducts();
  }

  @override
  Future<Either<Failures, CartProductModel>> getCartList(String token) {
    return homeRemoteDsImple.getCartList(token);
  }

  @override
  Future<void> addToCartList(String id, String token) async {
    await homeRemoteDsImple.addToCartList(id, token);
  }

  @override
  Future<void> addToWishList(String id, String token) async {
    await homeRemoteDsImple.addToWishList(id, token);
  }

  @override
  Future<void> deleteFromCartList(String id, String token) async {
    await homeRemoteDsImple.deleteFromCartList(id, token);
  }

  @override
  Future<void> deleteFromWishList(String id, String token) async {
    await homeRemoteDsImple.deleteFromWishList(id, token);
  }
}
