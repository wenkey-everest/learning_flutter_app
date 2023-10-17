import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter_app/domain/repository/remote_news_repository.dart';
import 'package:learning_flutter_app/locator.dart';
import 'package:learning_flutter_app/presentation/bloc/news_bloc.dart';
import 'package:learning_flutter_app/presentation/screens/home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsBloc(newsRepository: sl.get<RemoteNewsRepository>())
            ..add(NewsFetched()),
      child: const HomeScreen(),
    );
  }
}
