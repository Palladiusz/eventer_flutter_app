import 'package:dio/dio.dart';

class EventerServices {
  fetchData() async {
    var dio = Dio();
    print('loading data...');
    Response response = await dio.get('http://10.0.2.2:3000/events');

    return response.data;
  }
}
