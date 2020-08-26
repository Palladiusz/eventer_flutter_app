import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eventer/models/event_model.dart';

class EventerServices {
  fetchData() async {
    var dio = Dio();
    print('loading data...');
    Response response = await dio.get('http://10.0.2.2:3000/events');
    List<dynamic> data = response.data;

    // print(data.map((event) async {
    //   var json = await EventModel.fromJson(event);
    //   await print(await json.desc);
    // }));

    // print(data.map((e) {
    //   print('element: $e');
    //   return 'lol';
    // }));

    return data;
  }
}
