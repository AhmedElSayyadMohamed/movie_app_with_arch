import 'package:get_it/get_it.dart';
import 'package:movie_app_with_clean_arch/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movie_app_with_clean_arch/movies/data/repository/movies_repository.dart';
import 'package:movie_app_with_clean_arch/movies/domain/base_repository/base_repository.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_details_use_cases/get_movie_details.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_use_cases/get_now_playing_movies.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_use_cases/get_popular_movies.dart';
import 'package:movie_app_with_clean_arch/movies/domain/use_cases/movie_use_cases/get_top_rated_movies.dart';
import '../../movies/presentation/controller/movie_bloc/bloc/movies_bloc.dart';
import '../../movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  static init() {
    // bloc
    sl.registerLazySingleton(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerLazySingleton(() => MovieDetailsBloc(sl()));
    //use cases
    sl.registerLazySingleton(() => GetNowPlayingMovies(sl()));
    sl.registerLazySingleton(() => GetPopularMovies(sl()));
    sl.registerLazySingleton(() => GetTopRatedMovies(sl()));
    sl.registerLazySingleton(() => GetMovieDetails(sl()));
    //Data Source
    sl.registerLazySingleton<BaseRemoteMovieDataSource>(
        () => RemoteMovieDataSource());
    //Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));
  }
}