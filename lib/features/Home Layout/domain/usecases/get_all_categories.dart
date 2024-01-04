import 'package:dartz/dartz.dart';
import 'package:shop_app/features/Home%20Layout/data/models/categories_model.dart';
import 'package:shop_app/features/Home%20Layout/domain/repositories/home_repo.dart';

import '../../../../core/eror/failuers.dart';

class GetAllCategories {
  HomeRepo homeRepo;
  GetAllCategories(this.homeRepo);
  Future<Either<Failures, CategoriesModel>> call() =>
      homeRepo.getAllCategories();
}
