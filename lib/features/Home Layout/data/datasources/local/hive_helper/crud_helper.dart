// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../user_db.dart';

class CrudHelper {
  static const String boxName = 'UserDbBox';

  static void add(UserDb user) {
    final box = Hive.box<UserDb>(boxName);
    box.add(user);
  }

  static void update(dynamic id, UserDb updatedUser) {
    final box = Hive.box<UserDb>(boxName);
    box.put(id, updatedUser);
  }

  static List<UserDb> getAll() {
    final box = Hive.box<UserDb>(boxName);
    return box.values.toList();
  }

  static UserDb? getById(dynamic id) {
    final box = Hive.box<UserDb>(boxName);
    return box.get(id);
  }

  static void delete(dynamic id) {
    final box = Hive.box<UserDb>(boxName);
    box.delete(id);
  }

  static void clear() {
    final box = Hive.box<UserDb>(boxName);
    box.clear();
  }

  static registsHive() async {
    await Hive.initFlutter();
    WidgetsFlutterBinding.ensureInitialized();
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(UserDbAdapter());
    await Hive.openBox<UserDb>(CrudHelper.boxName);
  }
}
