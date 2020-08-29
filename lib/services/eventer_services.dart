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

  void deleteEvent() async {
    try {
      await dio.delete(
        'http://10.0.2.2:3000/events',
        data: {
          "id": 8,
          "name":
              "tttttttttSkonczony testowy event z troche dluuuuuuuuuzsza nazwa niz normalny event",
          "description":
              "Description, description, description, description, description, description, description, description",
          "date": "2020-08-31T00:00:00Z",
          "checkedOut": true
        },
      );
      print('deleted');
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
