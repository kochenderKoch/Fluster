import 'package:json_annotation/json_annotation.dart';

part 'kontests.g.dart';

/// One Model for API Response from https://kontests.net/api/v1/all
@JsonSerializable()
class KontestsModel {
  /// Constructor of [KontestsModel]
  KontestsModel(
    this.name,
    this.url,
    this.startTime,
    this.endTime,
    this.duration,
    this.in24Hours,
    this.site,
    this.status,
  );

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$TextFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory KontestsModel.fromJson(Map<String, dynamic> json) =>
      _$KontestsModelFromJson(json);

  /// Name
  final String name;

  /// Name
  final String url;

  /// Name
  @JsonKey(name: 'start_time')
  final String startTime;

  /// Name
  @JsonKey(name: 'end_time')
  final String endTime;

  /// Name
  final String duration;

  /// Name
  final String site;

  /// Name
  @JsonKey(name: 'in_24_hours')
  final String in24Hours;

  /// Name
  final String status;

  /// to Json
  Map<String, dynamic> toJson() => _$KontestsModelToJson(this);
}

// /// All Models for API Response from https://kontests.net/api/v1/all
// @JsonSerializable()
// class AllKontestsModels {
//   /// Constructor of [AllKontestsModels]
//   AllKontestsModels(this.kontestsModels);

//   /// A necessary factory constructor for creating a new User instance
//   /// from a map. Pass the map to the generated `_$TextFromJson()` constructor.
//   /// The constructor is named after the source class, in this case, User.
//   factory AllKontestsModels.fromJson(Map<String, dynamic> json) =>
//       _$AllKontestsModelsFromJson(json);

//   /// All [KontestsModel] in a list
//   List<KontestsModel> kontestsModels;
// }
