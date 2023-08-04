import 'package:isar/isar.dart';

part 'text.g.dart';

@collection
class Text {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(type: IndexType.value)
  String? text;
}
