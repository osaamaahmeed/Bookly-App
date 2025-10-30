import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implemetnation.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImplemetnation>(
    HomeRepoImplemetnation(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(apiService: getIt.get<ApiService>()),
    ),
  );
  getIt.registerSingleton<FetchNewestBooksUseCase>(
    FetchNewestBooksUseCase(homeRepo: getIt.get<HomeRepoImplemetnation>()),
  );
  getIt.registerSingleton<FetchFeaturedBooksUseCase>(
    FetchFeaturedBooksUseCase(homeRepo: getIt.get<HomeRepoImplemetnation>()),
  );
}
