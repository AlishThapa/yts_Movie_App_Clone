class Data {
  List<Movies> movies;
  bool isData;

  Data({required this.movies, this.isData = false});
}

class Movies {
  String title;
  String largeCoverImage;
  int year;
  List<String> genre;
  num? rating;
  num? runtime;
  String summary;
  List<Torrents> torrents;

  Movies(
      {required this.title,
      required this.largeCoverImage,
      required this.year,
      required this.genre,
      required this.rating,
      required this.runtime,
      required this.summary,
      required this.torrents});

  // Movies copyWith({
  //   String? title,
  //   String? largeCoverImage,
  //   int? year,
  //   List<String>? genre,
  //   num? rating,
  //   num? runtime,
  //   String? summary,
  //   Torrents? torrents,
  // }) {
  //   return Movies(
  //     title: title ?? this.title,
  //     largeCoverImage: largeCoverImage ?? this.largeCoverImage,
  //     year: year ?? this.year,
  //     genre: genre ?? this.genre,
  //     rating: rating ?? this.rating,
  //     runtime: runtime ?? this.runtime,
  //     summary: summary ?? this.summary, torrents:Torrents,
  //   );
  // }

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
        title: json['title'],
        largeCoverImage: json['large_cover_image'],
        year: json['year'],
        genre: (json['genres'] as List).map((e) => e.toString()).toList(),
        rating: json['rating'],
        runtime: json['runtime'],
        summary: json["summary"], torrents: [],

    );
  }

}

class Torrents {
  String size;

  Torrents({required this.size});

  factory Torrents.fromJson(Map<String, dynamic> json) => Torrents(size: json['size']);
}
