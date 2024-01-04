import 'package:shop_app/features/Home%20Layout/domain/repositories/home_repo.dart';

class DeleteWishListUseCase {
  HomeRepo homeRepo;
  DeleteWishListUseCase(this.homeRepo);
  Future<void> call(String id, String token) =>
      homeRepo.deleteFromWishList(id, token);
}
