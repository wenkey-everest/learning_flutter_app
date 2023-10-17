import 'package:get_it/get_it.dart';
import 'package:learning_flutter_app/data/news_api_service.dart';
import 'package:learning_flutter_app/data/repository/remote_data_repository_impl.dart';
import 'package:learning_flutter_app/domain/repository/remote_news_repository.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  sl.registerSingleton<NewsApiService>(NewsApiService());

  sl.registerSingleton<RemoteNewsRepository>(
      RemoteDataRepositoryImpl(sl.get<NewsApiService>()));
}
