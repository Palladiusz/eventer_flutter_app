// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return EventModel(
    id: json['id'] as int,
    title: json['title'] as String,
    desc: json['desc'] as String,
    date: DateTime.parse(json['date'] as String),
    checkedOut: json['checkedOut'] as bool,
  );
}

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'date': instance.date.toIso8601String(),
      'checkedOut': instance.checkedOut,
    };
