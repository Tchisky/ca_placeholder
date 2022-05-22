import 'package:ca_place_holder/core/domain/usecase.dart';
import 'package:ca_place_holder/feature_todo/domain/entities/failure.dart';
import 'package:dartz/dartz.dart';

class UseCaseValidateId implements UseCase<Either<Failure, int>, String> {
  @override
  Either<Failure, int> call(String param) {
    try {
      final int id = int.parse(param);
      return right(id);
    } on FormatException catch (e) {
      return left(FormatFailure());
    }
  }
}
