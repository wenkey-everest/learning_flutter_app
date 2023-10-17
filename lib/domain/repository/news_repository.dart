import 'package:learning_flutter_app/data/news_api_service.dart';
import 'package:learning_flutter_app/domain/modals/article.dart';

class NewsRepository {
  Future<List<Article>> getAllArticles() => NewsApiService().fetchNewsPosts();
}
