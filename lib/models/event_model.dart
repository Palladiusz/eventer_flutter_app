import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel {
  int id;

  @JsonKey(name: "name")
  String title;

  @JsonKey(name: "description")
  String desc;

  DateTime date;
  bool checkedOut;

  EventModel({this.id, this.title, this.desc, this.date, this.checkedOut});

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
