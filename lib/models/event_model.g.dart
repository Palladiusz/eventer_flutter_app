// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return EventModel(
    id: json['id'] as int,
    title: json['name'] as String,
    desc: json['description'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    checkedOut: json['checkedOut'] as bool,
  );
}

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.title,
      'description': instance.desc,
      'date': instance.date?.toIso8601String(),
      'checkedOut': instance.checkedOut,
    };
