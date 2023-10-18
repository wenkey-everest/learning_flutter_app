import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:learning_flutter_app/domain/modals/article.dart';
import 'package:learning_flutter_app/domain/repository/local_news_repository.dart';
import 'package:learning_flutter_app/domain/repository/remote_news_repository.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final RemoteNewsRepository newsRepository;
  final LocalNewsRepository localNewsRepository;

  NewsBloc({required this.newsRepository, required this.localNewsRepository})
      : super(NewsInitial()) {
    on<NewsFetched>((event, emit) async {
      final connectivityPlus = await (Connectivity().checkConnectivity());
      if (connectivityPlus == ConnectivityResult.wifi) {
        final items = await newsRepository.getAllArticles();
        items.forEach((element) {
          localNewsRepository.saveArticle(element);
        });
        print("internet");
        emit(NewsSuccess(items: items));
      } else {
        print("local");
        final items = await localNewsRepository.getAllArticles();
        emit(NewsSuccess(items: items));
      }
    });
  }

  @override
  void onChange(Change<NewsState> change) {
    print(change);
    super.onChange(change);
  }
}
