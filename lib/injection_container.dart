import 'package:clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_architecture/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(sl())
  );

  //UseCases
  sl.registerSingleton<GetArticleUseCase>(
      GetArticleUseCase(sl())
  );
  //
  // sl.registerSingleton<GetSavedArticleUseCase>(
  //     GetSavedArticleUseCase(sl())
  // );
  //
  // sl.registerSingleton<SaveArticleUseCase>(
  //     SaveArticleUseCase(sl())
  // );
  //
  // sl.registerSingleton<RemoveArticleUseCase>(
  //     RemoveArticleUseCase(sl())
  // );


  //Blocs
  sl.registerFactory<RemoteArticleBloc>(
          ()=> RemoteArticleBloc(sl())
  );

  // sl.registerFactory<LocalArticleBloc>(
  //         ()=> LocalArticleBloc(sl(),sl(),sl())
  // );


}