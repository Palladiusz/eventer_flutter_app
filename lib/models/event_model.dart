import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel extends Equatable {
  final String id;

  @JsonKey(name: "name")
  String title;

  @JsonKey(name: "description")
  String desc;

  DateTime date;
  bool checkedOut;

  EventModel({
    this.id,
    this.title,
    this.desc,
    this.date,
    this.checkedOut,
  });

  EventModel copyWith({
    String id,
    String title,
    String desc,
    DateTime date,
    bool checkedOut,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      date: date ?? this.date,
      checkedOut: checkedOut ?? this.checkedOut,
    );
  }

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);

  @override
  List<Object> get props => [id, title, desc, date, checkedOut];
}
