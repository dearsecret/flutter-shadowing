class TodaysWebtoon {
  final String id, title, thumb;

  TodaysWebtoon.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        thumb = json["thumb"];
}

class WebtoonDetail {
  final String about, genre, age, thumb;

  WebtoonDetail.fromJson(Map<String, dynamic> json)
      : about = json["about"],
        genre = json["genre"],
        age = json["age"],
        thumb = json["thumb"];
}

class Episodes {
  final String id, title, rating, date;

  Episodes.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        rating = json["rating"],
        date = json["date"];
}
