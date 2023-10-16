import 'package:flutter/material.dart';
import 'package:learning_flutter_app/providers/counter_provider.dart';
import 'package:learning_flutter_app/screens/details_screen.dart';
import 'package:learning_flutter_app/screens/home_screen.dart';
import 'package:learning_flutter_app/services/notification_service.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initializeNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final routes = <String, Widget Function(BuildContext)>{
    "/details": (context) => const DetailsScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
      ],
      child: MaterialApp(
        routes: routes,
        home: HomeScreen(),
      ),
    );
  }
}
