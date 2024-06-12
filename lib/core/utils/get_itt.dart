import 'package:get_it/get_it.dart';
import 'package:shop_app/core/api/api_manager.dart';
import 'package:shop_app/features/Home%20Layout/data/datasources/remote/remote_ds_impl.dart';
import 'package:shop_app/features/Home%20Layout/data/repositories/home_repo_impl.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/add_cart.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/add_wish_list.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/delete_cart.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/delete_wish_list.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/get_all_categories.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/get_all_products.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/get_cart_list.dart';
import 'package:shop_app/features/Home%20Layout/domain/usecases/get_wish_list.dart';
import 'package:shop_app/features/Home%20Layout/presentation/bloc/home_layout_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
      () => HomeLayoutBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetWishListUseCase(sl()));
  sl.registerLazySingleton(() => GetAllCategories(sl()));
  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetCartListUseCase(sl()));
  sl.registerLazySingleton(() => AddCartUseCase(sl()));
  sl.registerLazySingleton(() => DeleteCartUseCase(sl()));
  sl.registerLazySingleton(() => AddWishListUseCase(sl()));
  sl.registerLazySingleton(() => DeleteWishListUseCase(sl()));

  // Repository
  sl.registerLazySingleton(() => HomeRepoImpl(sl()));

  // Data sources
  sl.registerLazySingleton(() => HomeRemoteDsImple(sl()));

  // Core
  sl.registerLazySingleton(() => ApiManager());
}
