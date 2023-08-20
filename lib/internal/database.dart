import 'package:fluster/models/text.dart';
import 'package:flutter/foundation.dart' show kIsWeb, kReleaseMode;
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
    if (!kIsWeb) {
      final dir = await getApplicationDocumentsDirectory();
      return Isar.open(
        schemas: [TextSchema],
        directory: dir.path,
        engine: IsarEngine.sqlite,
        encryptionKey: 'superSecretKey!',
        // ignore: avoid_redundant_argument_values
        inspector: !kReleaseMode,
      );
    } else {
      return Isar.open(
        schemas: [TextSchema],
        directory: Isar.sqliteInMemory,
        engine: IsarEngine.sqlite,
        encryptionKey: 'superSecretKey',
        // ignore: avoid_redundant_argument_values
        inspector: !kReleaseMode,
      );
    }
  }

  /// Adds a [Text] to the matching table in the [db]
  Future<void> addText(Text text) async {
    final isar = await db;
    isar.write((isar2) {
      isar2.texts.put(text); // insert & update
    });
  }

  /// Remove a [Text] from the matching table in the [db]
  Future<void> removeText(Text mail) async {
    final isar = await db;
    final existingEmail = isar.texts.get(mail.id);
    isar.write((isar2) {
      isar2.texts.delete(existingEmail!.id); // delete
    });
  }

  /// Gets all [Text]-Objects as a [List] from the matching table in the [db]
  Future<List<Text>> getTexts() async {
    final isar = await db;
    return isar.texts.where().findAll();
  }
}
