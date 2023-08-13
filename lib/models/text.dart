import 'package:isar/isar.dart';

part 'text.g.dart';

/// Model for simple [Text]
@collection
class Text {
  /// AutoIncrement [Id]
  Id id = Isar.autoIncrement;

  /// [text] of the Dataset. The value is indexed.
  @Index(type: IndexType.value)
  String? text;
}
