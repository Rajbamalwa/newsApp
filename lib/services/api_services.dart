import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../constants/constant.dart';
import '../model/HeadlineNewsModel.dart';

class ApiServices {
  Future<HeadlineNewsModel> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get(Uri.parse(
          "${Strings.news_url}${Strings.API_KEY}${Strings.ApiPages}1"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = HeadlineNewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }

  fetchData(String apiUrl) async {
    try {
      final response = await http.get(
        Uri.parse(Strings.news_url + apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
      );
      log(response.toString());

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        log(response.body);
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load data');
    }
  }

  postApis(postUrl, headers, Object? body) async {
    try {
      var res = await http.post(
        Uri.parse(Strings.news_url + postUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: body,
      );
      log(res.statusCode.toString());
      log(res.body.toString());
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
