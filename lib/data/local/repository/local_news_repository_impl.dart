import 'package:learning_flutter_app/data/local/app_database.dart';
import 'package:learning_flutter_app/domain/modals/article.dart';
import 'package:learning_flutter_app/domain/repository/local_news_repository.dart';

class LocalNewsRepositoryImpl extends LocalNewsRepository {
  final AppDatabase appDatabase;

  LocalNewsRepositoryImpl(this.appDatabase);

  @override
  Future<List<Article>> getAllArticles() {
    return appDatabase.articleDao.getAllArticles();
  }

  @override
  Future<void> saveArticle(Article article) {
    return appDatabase.articleDao.saveArticle(article);
  }
}
