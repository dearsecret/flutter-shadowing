class TodaysWebtoon {
  final String id, title, thumb;

  TodaysWebtoon.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        thumb = json["thumb"];
}
