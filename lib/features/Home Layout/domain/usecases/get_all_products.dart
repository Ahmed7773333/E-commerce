import 'package:dartz/dartz.dart';
import 'package:shop_app/features/Home%20Layout/data/models/products_model.dart';
import 'package:shop_app/features/Home%20Layout/domain/repositories/home_repo.dart';

import '../../../../core/eror/failuers.dart';

class GetAllProducts {
  HomeRepo homeRepo;
  GetAllProducts(this.homeRepo);
  Future<Either<Failures, ProductsModel>> call() => homeRepo.getAllProducts();
}
