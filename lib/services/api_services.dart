import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shadow_api/models/webtoon_models.dart';

class ApiServices {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<TodaysWebtoon>> getTodaysWebtoon() async {
    List<TodaysWebtoon> webtoonInstances = [];
    final url = Uri.parse("$baseUrl/$today");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(TodaysWebtoon.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
