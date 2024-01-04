import 'package:shop_app/features/Home%20Layout/domain/repositories/home_repo.dart';

class AddWishListUseCase {
  HomeRepo homeRepo;
  AddWishListUseCase(this.homeRepo);
  Future<void> call(String id, String token) =>
      homeRepo.addToWishList(id, token);
}
