import 'package:fluster/models/text.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

/// A class to manage CRUD-Transactions on an given [Isar]-Database
class IsarDatabase {
  /// Creates an [IsarDatabase] Instance and
  /// opens the [Isar]-Database for Transactions
  IsarDatabase() {
    db = openDB();
  }

  /// The [Isar] Database Instance
  late Future<Isar> db;

  /// Opens the given [Isar]-Databse from the Applications-Directory
  /// The Inspector is started only in debug mode.
  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return Isar.open(
        [TextSchema],
        directory: dir.path,
        // ignore: avoid_redundant_argument_values
        inspector: !kReleaseMode,
      );
    }
    return Future.value(Isar.getInstance());
  }

  /// Adds a [Text] to the matching table in the [db]
  Future<void> addText(Text text) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.texts.put(text); // insert & update
    });
  }

  /// Remove a [Text] from the matching table in the [db]
  Future<void> removeText(Text mail) async {
    final isar = await db;
    final existingEmail = await isar.texts.get(mail.id);
    await isar.writeTxn(() async {
      await isar.texts.delete(existingEmail!.id); // delete
    });
  }

  /// Gets all [Text]-Objects as a [List] from the matching table in the [db]
  Future<List<Text>> getTexts() async {
    final isar = await db;
    return isar.texts.where().findAll();
  }
}
