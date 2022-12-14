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

  static Future<WebtoonDetail> getDetail(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetail.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<Episodes>> getEpisodes(String id) async {
    List<Episodes> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        episodesInstances.add(Episodes.fromJson(webtoon));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
