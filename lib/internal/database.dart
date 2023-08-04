import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/text.dart';

class IsarDatabase {
  late Future<Isar> db;

  IsarDatabase() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [TextSchema],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  void addText(Text text) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.texts.put(text); // insert & update
    });
  }

  void removeText(Text mail) async {
    final isar = await db;
    final existingEmail = await isar.texts.get(mail.id);
    await isar.writeTxn(() async {
      await isar.texts.delete(existingEmail!.id); // delete
    });
  }

  Future<List<Text>> getTexts() async {
    final isar = await db;
    return isar.texts.where().findAll();
  }
}
