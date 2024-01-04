import 'package:hive/hive.dart';
import 'package:shop_app/features/Home%20Layout/data/datasources/local/hive_helper/hive_types.dart';
import 'package:shop_app/features/Home%20Layout/data/datasources/local/hive_helper/hive_adapters.dart';
import 'package:shop_app/features/Home%20Layout/data/datasources/local/hive_helper/user_db_fields.dart';

part 'user_db.g.dart';

@HiveType(typeId: HiveTypes.userDb, adapterName: HiveAdapters.userDb)
class UserDb extends HiveObject {
  @HiveField(UserDbFields.name)
  String name;
  @HiveField(UserDbFields.password)
  String password;
  @HiveField(UserDbFields.email)
  String email;
  @HiveField(UserDbFields.phone)
  String phone;
  @HiveField(UserDbFields.favs)
  List<String> favs;
  @HiveField(UserDbFields.carts)
  List<String> carts;
  @HiveField(UserDbFields.token)
  String token;
  UserDb([
    this.name = '',
    this.password = '',
    this.email = '',
    this.phone = '',
    this.favs = const [],
    this.carts = const [],
    this.token = '',
  ]);
}
