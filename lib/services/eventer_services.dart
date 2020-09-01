import 'package:dio/dio.dart';
import '../models/event_model.dart';
import 'package:uuid/uuid.dart';

class EventerServices {
  final dio = Dio();
  var uuid = Uuid();

  Future<List<EventModel>> fetchData() async {
    Response response = await dio.get('http://10.0.2.2:3000/events');
    final data =
        (response.data as List).map((e) => EventModel.fromJson(e)).toList();

    data.sort((a, b) => a.date.compareTo(b.date));
    return data;
  }

  void postEvent({String title, String desc, String dateString}) async {
    await dio.post(
      'http://10.0.2.2:3000/events',
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

  void deleteEvent({String id}) async {
    try {
      await dio.request(
        'http://10.0.2.2:3000/events/$id',
        options: Options(method: 'DELETE'),
      );
      print('deleted');
    } on DioError catch (e) {
      print(e.error);
    }
  }

  void editEvent({EventModel model}) async {
    try {
      await dio.request(
        'http://10.0.2.2:3000/events/${model.id}',
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
}
