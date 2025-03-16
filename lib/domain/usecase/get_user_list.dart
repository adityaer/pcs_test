import 'package:dartz/dartz.dart';
import 'package:pcs_test/domain/entity/user.dart';
import 'package:pcs_test/domain/repository/app_repository.dart';
import 'package:pcs_test/util/failure.dart';

class GetUserList {
  final AppRepository _repository;

  GetUserList(this._repository);

  Future<Either<Failure, List<User>>> execute() {
    return _repository.getUserList();
  }
}
