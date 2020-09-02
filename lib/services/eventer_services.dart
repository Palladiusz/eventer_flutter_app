import 'package:dio/dio.dart';
import '../models/event_model.dart';
import 'package:uuid/uuid.dart';

class EventerServices {
  final dio = Dio();
  var uuid = Uuid();

  final baseApi = "http://localhost:3000";

  Future<List<EventModel>> fetchData() async {
    Response response = await dio.get('$baseApi/events');
    final data =
        (response.data as List).map((e) => EventModel.fromJson(e)).toList();

    data.sort((a, b) => a.date.compareTo(b.date));
    return data;
  }

  Future<void> postEvent({String title, String desc, String dateString}) async {
    await dio.post(
      '$baseApi/events',
      data: {
        "id": uuid.v4(),
        "name": title,
        "description": desc,
        "date": dateString,
        "checkedOut": false
      },
    );
    print('posted');
  }

  Future<void> deleteEvent({String id}) async {
    try {
      await dio.request(
        '$baseApi/events/$id',
        options: Options(method: 'DELETE'),
      );
      print('deleted');
    } on DioError catch (e) {
      print(e.error);
    }
  }

  Future<void> editEvent({EventModel model}) async {
    try {
      await dio.request(
        '$baseApi/events/${model.id}',
        data: {
          "name": model.title,
          "description": model.desc,
          "date": model.date.toIso8601String(),
          "checkedOut": model.checkedOut
        },
        options: Options(method: 'PUT'),
      );
      print('edited');
    } on DioError catch (e) {
      print(e.error);
    }
  }

  Stream<int> tick({int ticks}) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }

  String formatNum(num) => num.toString().padLeft(2, '0');

  Stream<bool> notNullValidator(value) async* {
    yield (value != null);
  }
}
