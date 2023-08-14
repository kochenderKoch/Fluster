// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kontests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KontestsModel _$KontestsModelFromJson(Map<String, dynamic> json) =>
    KontestsModel(
      json['name'] as String,
      json['url'] as String,
      json['start_time'] as String,
      json['end_time'] as String,
      json['duration'] as String,
      json['in_24_hours'] as String,
      json['site'] as String,
      json['status'] as String,
    );

Map<String, dynamic> _$KontestsModelToJson(KontestsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'duration': instance.duration,
      'site': instance.site,
      'in_24_hours': instance.in24Hours,
      'status': instance.status,
    };
