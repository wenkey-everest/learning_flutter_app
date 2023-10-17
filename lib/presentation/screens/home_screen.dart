import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter_app/presentation/bloc/news_bloc.dart';
import 'package:learning_flutter_app/presentation/widgets/custom_list_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text("ListView"),
          ),
          body: Container(
            child: state is NewsSuccess
                ? ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      return customListTile(state.items[index], context);
                    },
                  )
                : const Center(child: CircularProgressIndicator()),
          )),
    );
  }
}
