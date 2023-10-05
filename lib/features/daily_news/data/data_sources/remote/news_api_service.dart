import 'package:clean_architecture/core/constants/constants.dart';
import 'package:clean_architecture/features/daily_news/data/models/article_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl:newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/posts')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles();
}