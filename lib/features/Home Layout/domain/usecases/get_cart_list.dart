import 'package:dartz/dartz.dart';
import 'package:shop_app/features/Home%20Layout/data/models/cart_product.dart';
import 'package:shop_app/features/Home%20Layout/domain/repositories/home_repo.dart';

import '../../../../core/eror/failuers.dart';

class GetCartListUseCase {
  HomeRepo homeRepo;
  GetCartListUseCase(this.homeRepo);
  Future<Either<Failures, CartProductModel>> call(String token) =>
      homeRepo.getCartList(token);
}
