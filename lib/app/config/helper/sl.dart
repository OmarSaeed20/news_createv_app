import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:news_createv_app/data/repository/get_article.dart';
import 'package:news_createv_app/domain/repository/get_article.dart';
import 'package:news_createv_app/domain/usecase/get_article_usecase.dart';
import 'package:news_createv_app/presentation/controllers/bloc/artical_bloc.dart';

import '../../../data/data_sorce/news_api_serves.dart';

final GetIt sl = GetIt.instance;
Future<void> initializeDependancies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // api
  sl.registerSingleton<NewsApiService>(NewsApiService(sl<Dio>()));

  // repo
  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(sl<NewsApiService>()),
  );

  // usecase
  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl<ArticleRepository>()),
  );

  // bloc
  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(sl<GetArticleUseCase>()),
  );
}
