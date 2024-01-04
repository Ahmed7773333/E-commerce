import 'package:hive/hive.dart';
import 'package:shop_app/features/Home Layout/data/datasources/local/user_db.dart';

void registerAdapters() {
	Hive.registerAdapter(UserDbAdapter());
}
