class MovieModel {
  final dynamic rank;
  final String title;
  final String description;
  final String image;
  final String bigImage;
  final List<dynamic> genre;
  final String thumbnail;
  final dynamic rating;
  final String id;
  final dynamic year;
  final String imdbId;
  final String imdbLink;
  final String trailerYoutubeId;
  final List<dynamic> writers;
  final int? isFilm;

  MovieModel({
    required this.title,
    required this.image,
    required this.id,
    required this.description,
    required this.bigImage,
    required this.genre,
    required this.imdbId,
    required this.imdbLink,
    required this.rank,
    required this.rating,
    required this.thumbnail,
    required this.year,
    required this.trailerYoutubeId,
    required this.writers,
    this.isFilm,
  });

  factory MovieModel.fromJson(Map json) {
    return MovieModel(
      title: json['title'],
      image: json['image'],
      id: json['id'],
      description: json['description'] ??'',
      bigImage: json['big_image']??"",
      genre: json['genre']?? [],
      imdbId: json['imdbid']??"",
      imdbLink: json['imdb_link']??"",
      rank: json['rank'],
      rating: json['rating'],
      thumbnail: json['thumbnail']??"",
      year: json['year'],
      trailerYoutubeId: json['trailer_youtube_id'] ?? '',
      writers: json['writers'] ?? [],
      isFilm: json['isFilm']
    );
  }


}
