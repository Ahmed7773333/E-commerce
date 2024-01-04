import 'package:dartz/dartz.dart';
import 'package:shop_app/features/Home%20Layout/data/models/wish_list_product.dart';
import 'package:shop_app/features/Home%20Layout/domain/repositories/home_repo.dart';

import '../../../../core/eror/failuers.dart';

class GetWishListUseCase {
  HomeRepo homeRepo;
  GetWishListUseCase(this.homeRepo);
  Future<Either<Failures, WishListProductModel>> call(String token) =>
      homeRepo.getWishList(token);
}
