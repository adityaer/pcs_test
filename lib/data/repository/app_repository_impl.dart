import 'package:dartz/dartz.dart';
import 'package:pcs_test/data/base/base_repository.dart';
import 'package:pcs_test/data/datasource/app_remote_data_source.dart';
import 'package:pcs_test/domain/entity/user.dart';
import 'package:pcs_test/domain/repository/app_repository.dart';
import 'package:pcs_test/util/failure.dart';

class AppRepositoryImpl extends BaseRepository implements AppRepository {
  final AppRemoteDataSource remoteDataSource;

  AppRepositoryImpl({required this.remoteDataSource});

  //Remote
  @override
  Future<Either<Failure, List<User>>> getUserList() async {
    return execute(() async {
      final result = await remoteDataSource.getUserList();

      return result.map((data) => data.toEntity()).toList();
    });
  }
}
