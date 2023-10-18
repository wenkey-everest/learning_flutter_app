import 'package:floor/floor.dart';
import 'package:learning_flutter_app/domain/modals/article.dart';

@dao
abstract class ArticleDao {
  @Query("SELECT * FROM Articles")
  Future<List<Article>> getAllArticles();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveArticle(Article article);
}
