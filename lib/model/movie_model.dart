class MovieModel {
  final String title;
  final String backDropPath;
  final String overview;
  final String posterPath;

  MovieModel({
    required this.title,
    required this.backDropPath,
    required this.overview,
    required this.posterPath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      backDropPath: json['backdrop_path'],
      overview: json['overview'],
      posterPath: json['poster_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'backdrop_path': backDropPath,
      'overview': overview,
      'poster_path': posterPath,
    };
  }
}
