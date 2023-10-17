import 'package:bloc/bloc.dart';
import 'package:learning_flutter_app/domain/modals/article.dart';
import 'package:learning_flutter_app/domain/repository/remote_news_repository.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final RemoteNewsRepository newsRepository;

  NewsBloc({required this.newsRepository}) : super(NewsInitial()) {
    on<NewsFetched>((event, emit) async {
      final items = await newsRepository.getAllArticles();
      emit(NewsSuccess(items: items));
    });
  }

  @override
  void onChange(Change<NewsState> change) {
    print(change);
    super.onChange(change);
  }
}
