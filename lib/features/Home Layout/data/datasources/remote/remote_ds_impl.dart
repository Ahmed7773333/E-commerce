import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/eror/failuers.dart';
import 'package:shop_app/features/Home%20Layout/data/datasources/remote/remote_ds.dart';
import 'package:shop_app/features/Home%20Layout/data/models/cart_product.dart';
import 'package:shop_app/features/Home%20Layout/data/models/categories_model.dart';
import 'package:shop_app/features/Home%20Layout/data/models/products_model.dart';
import 'package:shop_app/features/Home%20Layout/data/models/wish_list_product.dart';

import '../../../../../core/api/api_manager.dart';
import '../../../../../core/api/end_points.dart';

class HomeRemoteDsImple implements HomeRemoteDs {
  ApiManager apiManager;

  HomeRemoteDsImple(this.apiManager);
  @override
  Future<Either<Failures, WishListProductModel>> getWishList(
      String token) async {
    try {
      Response response =
          await apiManager.getDataa(EndPoints.wishList, data: {'token': token});

      WishListProductModel wishListProductModel =
          WishListProductModel.fromJson(response.data);
      return Right(wishListProductModel);
    } catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartProductModel>> getCartList(String token) async {
    try {
      Response response =
          await apiManager.getDataa(EndPoints.cart, data: {'token': token});
      debugPrint('here');
      CartProductModel cartProductModel =
          CartProductModel.fromJson(response.data);
      debugPrint(cartProductModel.numOfCartItems.toString());

      return Right(cartProductModel);
    } catch (e) {
      debugPrint('error');

      return Left(RemoteFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoriesModel>> getAllCategories() async {
    try {
      Response response = await apiManager.getData(EndPoints.categories);

      CategoriesModel categoriesModel = CategoriesModel.fromJson(response.data);
      return Right(categoriesModel);
    } catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductsModel>> getAllProducts() async {
    try {
      Response response = await apiManager.getData(EndPoints.getAllProducts);

      ProductsModel productsModel = ProductsModel.fromJson(response.data);
      return Right(productsModel);
    } catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }

  @override
  Future<void> addToCartList(String id, String token) async {
    try {
      await apiManager.postDataa(EndPoints.cart,
          body: {"productId": id}, data: {'token': token});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> addToWishList(String id, String token) async {
    try {
      await apiManager.postDataa(EndPoints.wishList,
          body: {"productId": id}, data: {'token': token});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> deleteFromCartList(String id, String token) async {
    try {
      await apiManager
          .deleteData('${EndPoints.cart}/$id', data: {'token': token});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> deleteFromWishList(String id, String token) async {
    try {
      await apiManager
          .deleteData('${EndPoints.wishList}/$id', data: {'token': token});
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
