import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class Usecase<t, Param> {
  Future<Either<Failure, t>> call([Param param]);
}

class NoParam {}
