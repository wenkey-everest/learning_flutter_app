import 'package:flutter/material.dart';
import 'package:learning_flutter_app/config/router.dart';
import 'package:learning_flutter_app/config/theme.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              ThemeProvider(),
        )
      ],
      child: Builder(builder: (context) {
        return MaterialApp.router(
          theme: themeData,
          routerConfig: router,
          darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
          themeMode: context.watch<ThemeProvider>().theme,
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
