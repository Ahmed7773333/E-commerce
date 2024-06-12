import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/Home%20Layout/data/datasources/local/hive_helper/crud_helper.dart';

import 'core/utils/my_bloc_observer.dart';
import 'my_app.dart';
import 'core/utils/get_itt.dart' as di;

void main() async {
  await CrudHelper.registsHive();
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
