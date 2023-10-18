import 'package:get_it/get_it.dart';
import 'package:learning_flutter_app/data/local/app_database.dart';
import 'package:learning_flutter_app/data/local/repository/local_news_repository_impl.dart';
import 'package:learning_flutter_app/data/remote/news_api_service.dart';

import 'package:learning_flutter_app/data/remote/repository/remote_data_repository_impl.dart';
import 'package:learning_flutter_app/domain/repository/local_news_repository.dart';
import 'package:learning_flutter_app/domain/repository/remote_news_repository.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  final db = await $FloorAppDatabase.databaseBuilder("Articles").build();
  sl.registerSingleton<AppDatabase>(db);

  sl.registerSingleton<LocalNewsRepository>(
      LocalNewsRepositoryImpl(sl.get<AppDatabase>()));

  sl.registerSingleton<NewsApiService>(NewsApiService());

  sl.registerSingleton<RemoteNewsRepository>(
      RemoteDataRepositoryImpl(sl.get<NewsApiService>()));
}
