import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter_app/config/router.dart';
import 'package:learning_flutter_app/config/theme.dart';
import 'package:learning_flutter_app/presentation/counter/cubit/counter_cubit.dart';
import 'package:learning_flutter_app/presentation/providers/counter_provider.dart';
import 'package:learning_flutter_app/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Builder(builder: (context) {
        return MaterialApp.router(
          theme: themeData,
          routerConfig: router,
          darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
