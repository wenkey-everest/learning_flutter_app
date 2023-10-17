part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsError extends NewsState {}

final class NewsSuccess extends NewsState {
  final List<Article> items;
  NewsSuccess({required this.items});
}
