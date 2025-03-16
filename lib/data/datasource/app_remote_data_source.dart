import 'package:pcs_test/data/base/base_remote_data_source.dart';
import 'package:pcs_test/data/model/user_model.dart';

abstract class AppRemoteDataSource {
  Future<List<UserModel>> getUserList();
}

class AppRemoteDataSourceImpl extends BaseRemoteDataSource
    implements AppRemoteDataSource {
  AppRemoteDataSourceImpl({required super.client});

  @override
  Future<List<UserModel>> getUserList() async {
    return await handleResponse<List<UserModel>>(
      client.get('$BASE_URL/test'),
      (data) =>
          List<UserModel>.from(data.map((model) => UserModel.fromJson(model))),
    );
  }
}
