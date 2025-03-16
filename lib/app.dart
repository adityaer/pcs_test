import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:get_it/get_it.dart';
import 'package:pcs_test/data/datasource/app_remote_data_source.dart';
import 'package:pcs_test/data/repository/app_repository_impl.dart';
import 'package:pcs_test/domain/repository/app_repository.dart';
import 'package:pcs_test/domain/usecase/get_user_list.dart';
import 'package:pcs_test/screen/user/user_notifier.dart';

class App {
  static final locator = GetIt.instance;

  static Future<void> initDI() async {
    var dio = Dio(
        BaseOptions(
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(milliseconds: 30000),
          receiveTimeout: const Duration(milliseconds: 45000),
          sendTimeout: const Duration(milliseconds: 60000),
          contentType: 'application/json',
          responseType: ResponseType.plain,
        ),
      )
      ..interceptors.add(
        HttpFormatter(
          loggingFilter: (request, response, error) {
            // We don't want to print the request/response when 201 is returned
            if (response?.statusCode == 201) {
              return false;
            }
            // Otherwise, the logs should print
            return true;
          },
        ),
      );

    locator.registerLazySingleton(() => dio);

    locator.registerFactory(() => UserNotifier(locator()));

    locator.registerLazySingleton(() => GetUserList(locator()));

    locator.registerLazySingleton<AppRepository>(
      () => AppRepositoryImpl(remoteDataSource: locator()),
    );

    locator.registerLazySingleton<AppRemoteDataSource>(
      () => AppRemoteDataSourceImpl(client: locator()),
    );
  }
}
