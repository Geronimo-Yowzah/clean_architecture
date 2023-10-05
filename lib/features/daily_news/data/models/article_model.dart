import 'package:clean_architecture/core/constants/constants.dart';
import 'package:clean_architecture/features/daily_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int ? id,
    int ? userId,
    String ? title,
    String ? body,
  }): super(
    id: id,
    userId: userId,
    title: title,
    body: body,
  );

  factory ArticleModel.fromJson(Map < String, dynamic > map) {
    return ArticleModel(
      id: map['id'] ?? "",
      title: map['title'] ?? "",
      userId: map['userId'] ?? "",
      body: map['body'] ?? "",
    );
  }

  // factory ArticleModel.fromEntity(ArticleEntity entity) {
  //   return ArticleModel(
  //       id: entity.id,
  //       author: entity.author,
  //       title: entity.title,
  //       description: entity.description,
  //       url: entity.url,
  //       urlToImage: entity.urlToImage,
  //       publishedAt: entity.publishedAt,
  //       content: entity.content
  //   );
  // }
}