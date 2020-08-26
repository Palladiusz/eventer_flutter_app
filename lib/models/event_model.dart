import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable(nullable: false)
class EventModel {
  EventModel({this.id, this.title, this.desc, this.date, this.checkedOut});

  int id;
  String title;
  String desc;
  DateTime date;
  bool checkedOut;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
