import 'package:dartz/dartz.dart';
import 'package:pcs_test/domain/entity/user.dart';
import 'package:pcs_test/util/failure.dart';

abstract class AppRepository {
  // Remote Data
  Future<Either<Failure, List<User>>> getUserList();
}
