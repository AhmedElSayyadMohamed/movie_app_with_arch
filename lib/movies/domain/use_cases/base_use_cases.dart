import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_arch/core/error/failure/failure.dart';

abstract class BaseUseCases<T> {

  Future<Either<Failure,T>> call();
}