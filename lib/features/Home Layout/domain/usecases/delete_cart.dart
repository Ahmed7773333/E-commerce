import 'package:shop_app/features/Home%20Layout/domain/repositories/home_repo.dart';

class DeleteCartUseCase {
  HomeRepo homeRepo;
  DeleteCartUseCase(this.homeRepo);
  Future<void> call(String id, String token) =>
      homeRepo.deleteFromCartList(id, token);
}
