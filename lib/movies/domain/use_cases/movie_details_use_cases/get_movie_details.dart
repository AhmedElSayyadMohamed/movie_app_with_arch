import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_arch/core/error/failure/failure.dart';
import 'package:movie_app_with_clean_arch/movies/domain/base_repository/base_repository.dart';
import '../../entity/movie.dart';
import 'movie_details_use_cases.dart';

class GetMovieDetailsUseCase
    extends BaseMovieDetailsUseCases<Movie, Parameters> {

  final BaseMoviesRepository _baseMoviesRepository;

  GetMovieDetailsUseCase(this._baseMoviesRepository);

  @override
  Future<Either<Failure, Movie>> call({required Parameters parameter}) {
    return _baseMoviesRepository.getMovieDetails(movieId: parameter.movieId!);
  }

}

class Parameters extends Equatable {
  final int? movieId;
  final int page;
  const Parameters({this.movieId, this.page = 1});

  @override
  List<Object?> get props => [movieId,page];
}