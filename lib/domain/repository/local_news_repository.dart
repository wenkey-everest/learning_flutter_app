import 'package:learning_flutter_app/domain/modals/article.dart';

abstract class LocalNewsRepository {
  Future<List<Article>> getAllArticles();

  Future<void> saveArticle(Article article);
}
