import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_testing_code/core/error/failure.dart';
// usecases will implement this base usecase class, specifying their return type

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
