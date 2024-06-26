import 'package:movie_app_with_clean_arch/movies/domain/entity/genres.dart';

// class MovieDetailsModel extends Movie {
//
//   MovieDetailsModel({
//     required super.id,
//     required super.title,
//     required super.posterPath,
//     required super.backdropPath,
//     required super.overview,
//     required super.releaseDate,
//     required super.voteAverage,
//     required super.genres,
//     required super.language,
//      super.isFavourite,
//   });
//
//   factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
//       MovieDetailsModel(
//         id: json['id'],
//         backdropPath: json['backdrop_path'],
//         title: json['title'],
//         overview: json['overview'],
//         releaseDate: json['release_date'],
//         language: json['spoken_languages'][0]['english_name'],
//         voteAverage: json['vote_average'],
//         genres: List.from(
//           json['genres'].map((element) => GenresModel.fromJson(element),
//           ),
//         ),
//         posterPath: json['poster_path'],
//         isFavourite: false,
//
//       );
//
//
//
// // const MovieDetailsModel({
// //   required super.id,
// //   required super.image,
// //   required super.title,
// //   required super.genres,
// //   required super.description,
// //   required super.releaseDate,
// //   required super.runtimeInSecond,
// //   required super.language,
// //   required super.voteAverage,
// //   required super.voteCount,
// // });
// //
// // factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
// //     MovieDetailsModel(
// //       id: json['id'],
// //       image: json['backdrop_path'],
// //       title: json['title'],
// //       description: json['overview'],
// //       releaseDate: json['release_date'],
// //       runtimeInSecond: json['runtime'],
// //       language: json['spoken_languages'][0]['english_name'],
// //       voteAverage: json['vote_average'],
// //       voteCount: json['vote_count'],
// //       genres: List.from(
// //           json['genres'].map((element) => GenresModel.fromJson(element),
// //           ),
// //       ),
// //     );
// }

class GenresModel extends Genres {
  const GenresModel({
    required super.id,
    required super.name,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) =>
      GenresModel(id: json['id'], name: json['name']);

  @override
  List<Object> get props => [];
}
