import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../features/home/data/data_sources/home_local_data_source.dart';
import '../../../features/home/data/data_sources/home_remote_data_source.dart';
import '../../../features/home/data/repos/home_repo_impl.dart';
import '../../../features/search/data/data_sources/search_remote_data_source.dart';
import '../../../features/search/data/repos/search_repo_impl.dart';
import '../api_service.dart';

final getIt = GetIt.instance;

void registerServices() {

  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );

  // Register SearchRemoteDataSourceImpl
  getIt.registerSingleton<SearchRemoteDataSourceImpl>(
    SearchRemoteDataSourceImpl(getIt<ApiService>()),
  );

  // Register SearchRepoImpl
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(getIt<SearchRemoteDataSourceImpl>()),
  );
}
