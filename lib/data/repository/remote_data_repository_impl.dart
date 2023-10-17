import 'package:learning_flutter_app/data/news_api_service.dart';
import 'package:learning_flutter_app/domain/modals/article.dart';
import 'package:learning_flutter_app/domain/repository/remote_news_repository.dart';

class RemoteDataRepositoryImpl implements RemoteNewsRepository {
  final NewsApiService newsApiService;

  RemoteDataRepositoryImpl(this.newsApiService);

  @override
  Future<List<Article>> getAllArticles() {
    return newsApiService.fetchNewsPosts();
  }
}
