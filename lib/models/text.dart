import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'text.g.dart';

/// Model for simple [Text]
@JsonSerializable()
@collection
class Text {
  /// Constructor for [Text]
  Text(this.id, this.text);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$TextFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Text.fromJson(Map<String, dynamic> json) => _$TextFromJson(json);

  /// AutoIncrement [int] Id
  int id;

  /// [text] of the Dataset. The value is indexed.
  @Index(name: 'text')
  String? text;

  /// `toJson` is the convention for a class to declare support for
  /// serialization to JSON. The implementation simply calls the
  /// private, generated helper method `_$TextToJson`.
  Map<String, dynamic> toJson() => _$TextToJson(this);
}
