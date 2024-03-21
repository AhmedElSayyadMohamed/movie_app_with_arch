import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_arch/core/constance/request_enum.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_details_use_cases/get_recommendation_for_a_movie.dart';
import 'package:movie_app_with_clean_arch/movies/presentation/controller/movie_details_bloc/movie_details_event.dart';
import '../../../domain/use_cases/get_trailer_movie/get_trailer_for_a_movie.dart';
import '../../../domain/use_cases/movie_details_use_cases/get_movie_details.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsStates> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCas;
  final GetTrailerForAMovieUseCase _getTrailerForAMovie;
  final GetRecommendationsUseCase _getRecommendationForAMovie;

  MovieDetailsBloc(
    this._getMovieDetailsUseCas,
    this._getTrailerForAMovie,
    this._getRecommendationForAMovie,
  ) : super(const MovieDetailsStates()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsFun);
    on<GetRecommendationsEvent>(_getRecommendationsFun);
    on<GetTrailersMovieEvent>(_getTrailersMovie);
  }
  FutureOr<void> _getMovieDetailsFun(
      GetMovieDetailsEvent event, Emitter<MovieDetailsStates> emit) async {
    var result = await _getMovieDetailsUseCas(parameter: Parameters(movieId:event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailState: RequestState.error,
          errorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailState: RequestState.success,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendationsFun(
      GetRecommendationsEvent event, Emitter<MovieDetailsStates> emit) async {
    var result =
        await _getRecommendationForAMovie(parameter: Parameters(movieId:event.id));
    result.fold(
        (l) => emit(
              state.copyWith(
                recommendationsMoviesState: RequestState.error,
                recommendationsMoviesErrorMessage: l.errorMessage,
              ),
            ), (r) {
      emit(state.copyWith(
        recommendationsMovies: r,
        recommendationsMoviesState: RequestState.success,
      ));
    });
  }

  FutureOr<void> _getTrailersMovie(
      GetTrailersMovieEvent event, Emitter<MovieDetailsStates> emit) async {
    var result =
        await _getTrailerForAMovie(parameter: Parameters(movieId:event.movieId));
    result.fold(
        (l) => emit(
              state.copyWith(
                trailerMovieState: RequestState.error,
                trailerMovieErrorMessage: l.errorMessage,
              ),
            ), (r) {
if (kDebugMode) {
  print(r.length);
}
if (kDebugMode) {
  print(r);
}
      emit(state.copyWith(
        trailersMovie: r,
        trailerMovieState: RequestState.success,
      ),
      );
    });
  }
}
