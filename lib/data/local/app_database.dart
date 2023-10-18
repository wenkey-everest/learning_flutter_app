import 'dart:async';

import 'package:floor/floor.dart';
import 'package:learning_flutter_app/data/local/converters/source_type_converter.dart';
import 'package:learning_flutter_app/data/local/dao/article_dao.dart';
import 'package:learning_flutter_app/domain/modals/article.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@TypeConverters([SourceTypeConverter])
@Database(version: 1, entities: [Article])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}
