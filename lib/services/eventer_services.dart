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
      await dio.request(
        'http://10.0.2.2:3000/events/d8e621e2-e712-430d-gbfe1-ac96a42212c7',
        options: Options(method: 'DELETE'),
      );
      print('deleted');
    } on DioError catch (e) {
      print(e.error);
    }
  }

  void formData() async {
    FormData formData = new FormData.fromMap({
      "id": "9a52939b-a730-42b6-a5ee-26c4da78cb3266",
      "name": "gfd",
      "description": "",
      "date": "2020-08-30T11:06:00.000",
      "checkedOut": false
    });
    await dio.post("http://10.0.2.2:3000/events", data: formData);
  }

  Stream<int> tick({int ticks}) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }

  String formatNum(num) => num.toString().padLeft(2, '0');
}
