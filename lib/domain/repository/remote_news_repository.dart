import 'package:learning_flutter_app/domain/modals/article.dart';

abstract class RemoteNewsRepository {
  Future<List<Article>> getAllArticles();
}
