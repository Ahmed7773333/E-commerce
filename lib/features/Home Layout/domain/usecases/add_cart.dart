import 'package:shop_app/features/Home%20Layout/domain/repositories/home_repo.dart';

class AddCartUseCase {
  HomeRepo homeRepo;
  AddCartUseCase(this.homeRepo);
  Future<void> call(String id, String token) =>
      homeRepo.addToCartList(id, token);
}
