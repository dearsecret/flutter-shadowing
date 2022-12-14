import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shadow_api/models/webtoon_models.dart';

class ApiServices {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  Future<List<TodaysWebtoon>> getTodaysWebtoon() async {
    List<TodaysWebtoon> webtoonInstances = [];
    final url = Uri.parse("$baseUrl/$today");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final instance = TodaysWebtoon.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
